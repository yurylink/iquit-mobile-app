import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iquit/model/BenefitsModel.dart';

class BenefitList extends StatelessWidget {
  List<BenefitModel> _listOfBenefits;
  BenefitList(this._listOfBenefits);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    width = width / 4;

    return Container(
        margin: EdgeInsets.fromLTRB(width, 5, 0, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (BenefitModel model in _listOfBenefits)
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'In ' + model.getDueText() + ': ' + model.name,
                    textAlign: TextAlign.left,
                  ))
          ],
        ));
  }
}
