import 'package:flutter/material.dart';

class space extends StatelessWidget {

  final double Hi;
  final double Wi;

  const space({super.key, required this.Hi, required this.Wi});
  
  @override
  Widget build(BuildContext context) {
    return Hi==0?SizedBox(width: Wi,):SizedBox(height: Hi,);
  }
}