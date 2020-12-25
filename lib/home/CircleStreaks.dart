import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iquit/model/StreaksDurationModel.dart';

// class CircleStreaks extends StatefulWidget {
//
//   String displayText;
//   CircleStreaks({this.displayText});
//
//   @override
//   _CircleStreaksState createState() => _CircleStreaksState(displayText);
// }
//
// class _CircleStreaksState extends State<CircleStreaks> {
//   String _displayText = "Not Initialized";
//
//   _CircleStreaksState(displayText){
//     if(this._displayText != null){
//       this._displayText = "notInit";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 230,
//         height: 230,
//         decoration:
//             new BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
//         child: Center(
//           child: Text(_displayText??"NotInitialized"),
//         ));
//   }
// }

class CircleStreaks extends StatelessWidget {
  String _displayText;

  CircleStreaks(String textSent) {
    this._displayText = textSent ?? "No Streak Initialized inner";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 230,
        height: 230,
        decoration:
            new BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        padding: EdgeInsets.all(20),
        child: Container(
          width: 50,
          height: 50,
          decoration: new BoxDecoration(
              color: Color.fromRGBO(46, 46, 46, 1), shape: BoxShape.circle),
          child: Center(
            child: Text(_displayText),
          ),
        ));
  }
}
