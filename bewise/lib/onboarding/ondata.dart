import 'package:flutter/material.dart';

class modeldata {
  String json;
  String text;
  String context;
  Color back;
  Color button;

  modeldata(
      {required this.json,
      required this.text,
      required this.context,
      required this.back,
      required this.button});
}

List<modeldata> screens = <modeldata>[
  modeldata(
      json: 'assets/json/no1.json',
      text: 'Need to choose',
      context:
          'Deliver an outstanding customer experience through additional control over the app',
      back: Colors.pink.shade100,
      button: Colors.purple.shade100),
  modeldata(
      json: 'assets/json/no2.json',
      text: 'Safe Access',
      context:
          'Track revenue & expences. This has to be the essential feature, no doubt ..',
      back: Colors.purple.shade100,
      button: Colors.pink.shade100),
  modeldata(
      json: 'assets/json/no3.json',
      text: 'Best Experience',
      context:
          'Increase efficiency and customer satisfaction with an app alignment to your needs.',
      back: Colors.cyan,
      button: Colors.blue.shade100)
];
