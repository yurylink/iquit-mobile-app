import 'package:flutter/material.dart';
import 'package:iquit/benefits/BenefitCard.dart';
import 'package:iquit/common/MyConstants.dart';
import 'package:iquit/model/BenefitsModel.dart';

class BenefitsMainPage extends StatefulWidget {
  List<BenefitModel> _listOfBenefits;
  BenefitsMainPage(this._listOfBenefits);

  @override
  _BenefitsMainPageState createState() => _BenefitsMainPageState(_listOfBenefits);
}

class _BenefitsMainPageState extends State<BenefitsMainPage> {
  List<BenefitCard> _listOfBenefitsCards;

  _BenefitsMainPageState(List<BenefitModel> _listOfBenefits){
    _listOfBenefitsCards = new List<BenefitCard>();
    for (BenefitModel currentBenefitModel in _listOfBenefits){
      _listOfBenefitsCards.add(new BenefitCard(currentBenefitModel));
    }
  }

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(MyConstants.of(context).benefitsPageName),
        ),
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: _listOfBenefitsCards
        ));
  }
}
