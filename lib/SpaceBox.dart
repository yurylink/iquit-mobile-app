import 'package:flutter/material.dart';

 class SpaceBox extends StatelessWidget {

  double space;

  SpaceBox(this.space);

  @override
   Widget build(BuildContext context) {
     return SizedBox(width: space, height: space,);
   }
 }
