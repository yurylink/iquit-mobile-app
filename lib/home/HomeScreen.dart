import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iquit/benefits/BenefitsMainPage.dart';
import 'package:iquit/database/DatabaseConfiguration.dart';
import 'package:iquit/development/mock/BenefitsModelMock.dart';
import 'package:iquit/home/BenefitList.dart';
import 'package:iquit/home/LastStreaksMainScreen.dart';
import 'package:iquit/home/PieChart.dart';
import 'package:iquit/model/BenefitsModel.dart';
import 'package:iquit/model/StreaksDurationModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  final dbHelper = DatabaseConfiguration.instance;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer timer;
  static const duration = const Duration(seconds: 1);

  int _counter = 0;
  bool _isRunning = false;
  DateTime _beginningOfStreak;
  String _displayText;
  List<StreaksDurationModel> _listOfPreviousStreaks =
      new List<StreaksDurationModel>();
  List<BenefitModel> _listOfBenefits = new List<BenefitModel>();

  @override
  void initState() {
    super.initState();
    _updateListOfPreviousStreaks();
    _updateTheListOfBenefits();

    if (timer == null) {
      timer = Timer.periodic(duration, (timer) {
        _resolveText();
      });
    }
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _beginningOfStreak = new DateTime.now().subtract(new Duration(
          days: _counter)); //TODO REMOVE THE SUBTRACT ON FINAL VERSION
    });
  }

  void _endTimer() async {
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

  //TODO: REMOVE THIS FUNCTION
  void _incrementCounter() async {
    List<StreaksDurationModel> resultList =
        await DatabaseConfiguration.instance.getAllStreaks();

    setState(() {
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

  void _updateListOfPreviousStreaks() async {
    Future<List<StreaksDurationModel>> futureListOfStreaks =
        DatabaseConfiguration.instance.getAllStreaks();

    setState(() {
      futureListOfStreaks.then((value) => _listOfPreviousStreaks = value);
    });
  }
  
  void _updateTheListOfBenefits() async{
    setState(() {
      _listOfBenefits = BenefitsModelMock.benefitsModelList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: [
                    PieChart(_displayText),
                    GestureDetector(
                      child: BenefitList(_listOfBenefits),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BenefitsMainPage(_listOfBenefits)));
                      },
                    ),
                    Container(
                      color: Colors.black54,
                      child: ButtonBar(
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: Text("End Streak"),
                            onPressed: _isRunning ? () => _endTimer() : null,
                          ),
                          ElevatedButton(
                            child: Text("Start Challenge"),
                            onPressed: _isRunning ? null : () => _startTimer(),
                          )
                        ],
                      ),
                    ),
                    LastStreaksMainScreen(_listOfPreviousStreaks),
                  ],
                ),
              ),
            )
          ],
        ));
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Align(
//         alignment: Alignment.topCenter,
//         child: Column(
//           children: <Widget>[
//             SpaceBox(20),
//             PieChart(),
//             // CircleTimer(_displayText),
//             SpaceBox(20),
//             BenefitsList(),
//             SpaceBox(20),
//             Container(
//               color: Colors.black54,
//               child: ButtonBar(
//                 alignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     child: Text("End Streak"),
//                     onPressed: _isRunning ? () => _endTimer() : null,
//                   ),
//                   ElevatedButton(
//                     child: Text("Start Challenge"),
//                     onPressed: _isRunning ? null : () => _startTimer(),
//                   )
//                 ],
//               ),
//             ),
//             LastStreaksMainScreen(_listOfPreviousStreaks)
//             // LastStreaksMainScreen(new List<StreaksDurationModel>())
//           ],
//         )),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods.
//   );
// }

}
