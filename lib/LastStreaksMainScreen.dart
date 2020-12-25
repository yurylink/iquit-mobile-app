import 'package:flutter/material.dart';
import 'package:iquit/model/StreaksDurationModel.dart';

class LastStreaksMainScreen extends StatelessWidget {
  static final int MAX_LENGHT = 5;
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
      if (MAX_LENGHT.compareTo(listOfText.length) >= 0) {
        listOfText.add(Text("Last Streak at " +
            element.getConvertedEndDate() +
            " " +
            element.getMaxStreak()));
      }
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
