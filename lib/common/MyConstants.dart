import 'package:flutter/material.dart';

class MyConstants extends InheritedWidget {
  static MyConstants of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<MyConstants>();

  const MyConstants({Widget child, Key key}): super(key: key, child: child);

  final String benefitsPageName = 'Benefits';
  final String benefitsDueBottomText = 'You archieve this after ';

  @override
  bool updateShouldNotify(MyConstants oldWidget) => false;
}
