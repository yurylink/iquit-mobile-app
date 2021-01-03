import 'package:flutter/material.dart';
import 'package:iquit/common/GlobalColors.dart';
import 'package:iquit/common/MyConstants.dart';
import 'package:iquit/model/BenefitsModel.dart';

class BenefitCard extends StatelessWidget {
  BenefitModel _benefitsModel;

  BenefitCard(this._benefitsModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(35),
      color: GlobalColors.DARK_GREY.color,
      child: Container(
        padding: EdgeInsets.all(35),
        decoration: BoxDecoration(
            color: GlobalColors.GREY.color,
            borderRadius: BorderRadius.all(Radius.circular(60)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: -2,
                  blurRadius: 7,
                  offset: Offset(7, 7),
                  color: Colors.black)
            ]),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(
                _benefitsModel.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset(7, 7), blurRadius: 7)
                ]),
              ),
            ),
            Expanded(child: Text(_benefitsModel.text)),
            Text(MyConstants.of(context).benefitsDueBottomText + _benefitsModel.getDueText()),
          ],
        ),
      ),
      // color: Colors.grey,
    );
  }
}
