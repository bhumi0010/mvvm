

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final Widget child;
  final List<Color> gradientColors;
  final Alignment beginAlignment;
  final Alignment endAlignment;

  CustomContainer({
    required this.child,
    required this.gradientColors,
    this.beginAlignment = Alignment.topLeft,
    this.endAlignment = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: beginAlignment,
          end: endAlignment,
          colors: gradientColors,
        ),
      ),
      child: child,
    );
  }
}