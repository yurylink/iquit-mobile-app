import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iquit/BenefitsList.dart';
import 'package:iquit/CircleStreaks.dart';
import 'package:iquit/LastStreaksMainScreen.dart';
import 'package:iquit/SpaceBox.dart';
import 'package:iquit/database/DatabaseConfiguration.dart';

import 'dart:async';

import 'package:iquit/model/StreaksDurationModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'IQuit -  Quit your addictions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final dbHelper = DatabaseConfiguration.instance;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer timer;
  static const duration = const Duration(seconds: 1);

  int _counter = 0;
  bool _isRunning = false;
  DateTime _beginningOfStreak;
  String _displayText;
  List<StreaksDurationModel> _listOfPreviousStreaks = new List<StreaksDurationModel>();

  void _initStreak() {
    setState(() {
      _isRunning = true;
      _beginningOfStreak = new DateTime.now().subtract(new Duration(
          days: _counter)); //TODO REMOVE THE SUBTRACT ON FINAL VERSION
    });
  }

  void _endStreak() async {
    Future<int> result = DatabaseConfiguration.instance.insertStreak(
        new StreaksDurationModel(null, _beginningOfStreak, DateTime.now()));
    result.whenComplete(() => {
          setState(() {
            _isRunning = false;
            _beginningOfStreak = null;
            _counter = 0;
            _updateListOfPreviousStreaks();
          })
        });
  }

  void _incrementCounter() async {
    List<StreaksDurationModel> resultList =
        await DatabaseConfiguration.instance.getAllStreaks();

    setState(() {
      resultList.forEach((element) {
        print(element.toString());
        print(element.toMapWithoutId());
      });
      _counter++;
      _beginningOfStreak = new DateTime.now().subtract(new Duration(
          days: _counter)); //TODO REMOVE THE SUBTRACT ON FINAL VERSION
    });
  }

  String _resolveText() {
    setState(() {
      StringBuffer result = new StringBuffer();

      if (_beginningOfStreak == null) {
        result.write("No Streak Initialized");
      } else {
        DateTimeRange range =
            DateTimeRange(start: _beginningOfStreak, end: DateTime.now());
        Duration duration = range.duration;
        if (duration.inDays.compareTo(0) > 0) {
          result.write(duration.inDays.toString());
          result.write(" Days of Streak !");
        } else if (duration.inHours.compareTo(0) > 0) {
          result.write(duration.inHours.toString());
          result.write(" Hours of Streak !");
        } else if (duration.inMinutes.compareTo(0) > 0) {
          result.write(duration.inMinutes.toString());
          result.write(" Minutes of Streak !");
        } else {
          result.write(duration.inSeconds.toString());
          result.write(" Seconds of Streak !");
        }
      }
      _displayText = result.toString();
    });
  }

  void _updateListOfPreviousStreaks() async{
    Future<List<StreaksDurationModel>> futureListOfStreaks =
        DatabaseConfiguration.instance.getAllStreaks();
    
    setState(() {
      futureListOfStreaks.then((value) => _listOfPreviousStreaks = value);
    });
  }

  @override
  void initState() {
    super.initState();
    if (timer == null) {
      timer = Timer.periodic(duration, (timer) {
        _resolveText();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              SpaceBox(20),
              CircleStreaks(_displayText),
              SpaceBox(20),
              BenefitsList(),
              SpaceBox(20),
              Container(
                color: Colors.black54,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text("End Streak"),
                      onPressed: _isRunning ? () => _endStreak() : null,
                    ),
                    ElevatedButton(
                      child: Text("Start Challenge"),
                      onPressed: _isRunning ? null : () => _initStreak(),
                    )
                  ],
                ),
              ),
              LastStreaksMainScreen(_listOfPreviousStreaks)
              // LastStreaksMainScreen(new List<StreaksDurationModel>())
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
