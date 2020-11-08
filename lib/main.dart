import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iquit/BenefitsList.dart';
import 'package:iquit/CircleStreaks.dart';
import 'package:iquit/SpaceBox.dart';

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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              CircleStreaks(),
              SpaceBox(20),
              BenefitsList(),
              SpaceBox(20),
              Container(
                color: Colors.black54,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text("ClickHere"),
                    ),
                    ElevatedButton(
                      child: Text("ClickHere"),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  color: Colors.black,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(children: [
                    Text(
                      "Last Streak: 15 Days",
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("Last Streak: 15 Days"),
                    Text("Last Streak: 15 Days"),
                    Text("Last Streak: 15 Days"),
                    Text("Last Streak: 15 Days"),
                    Text("Last Streak: 15 Days"),
                  ]),
                ),
              )

              // Text(
              //   'You have pushed the button this many times:',
              // ),
              // Text(
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headline4,
              // ),
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
