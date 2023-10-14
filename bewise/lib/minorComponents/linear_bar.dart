// ignore_for_file: camel_case_types, unused_element, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../color/colors.dart';

class linear_bar extends StatelessWidget {
  final double percent;
  linear_bar(this.percent);

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 12,
      animation: true,
      animationDuration: 2100,
      percent: percent,
      backgroundColor: Colors.pink.shade400,
      linearGradient:
          LinearGradient(colors: [Colors.lightGreenAccent, Colors.greenAccent]),
    );
  }
}
