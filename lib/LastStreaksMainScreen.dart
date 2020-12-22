import 'package:flutter/material.dart';
import 'package:iquit/model/StreaksDurationModel.dart';

class LastStreaksMainScreen extends StatelessWidget {
  List<StreaksDurationModel> listOfLastStreaks;
  String _titleText;

  LastStreaksMainScreen(List<StreaksDurationModel> futureListOfStreaks) {
    this.listOfLastStreaks = futureListOfStreaks;

    if (this.listOfLastStreaks != null && this.listOfLastStreaks.isNotEmpty) {
      this._titleText =
          "Last Streak: " + listOfLastStreaks.first.getMaxStreak();
    } else {
      this._titleText = "No register";
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Text> listOfText = new List<Text>();

    listOfText.add(Text(
      _titleText,
      style: TextStyle(fontSize: 24),
    ));

    listOfLastStreaks.forEach((element) {
      listOfText.add(Text("Last Streak at " +
          element.getConvertedEndDate() +
          " " +
          element.getMaxStreak()));
    });

    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        constraints: BoxConstraints(maxHeight: double.infinity),
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(children: listOfText),
      ),
    );
  }
}
