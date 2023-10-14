// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class addbutton extends StatelessWidget {
  final function;
  addbutton({required this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 18, 29, 40),
              boxShadow: [BoxShadow(color: Colors.cyanAccent, blurRadius: 16)]),
          margin: EdgeInsets.only(right: 2, bottom: 10),
          child: Image.asset(
            'assets/icons/addbutton.png',
            height: 42,
          ),
        ));
  }
}
