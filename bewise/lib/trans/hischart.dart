// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../minorComponents/sizedBox.dart';

class Exdata extends StatelessWidget {
  final String name;
  final String amount;
  final String ipath;
  final String eori;

  Exdata({
    required this.eori,
    required this.name,
    required this.ipath,
    required this.amount,
  });
  @override
  //

//
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            Colors.lightBlueAccent.withOpacity(.3),
            Colors.cyanAccent.withOpacity(.15)
          ],
        ),
        border: Border.all(
            color: Colors.lightBlueAccent.withOpacity(.6), width: 1.85),
      ),
      height: 50,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              eori == 'expence'
                  ? ipath != ''
                      ? Image.asset(
                          'assets/icons/expence/${ipath}.png',
                        )
                      : Image.asset(
                          'assets/icons/new.png',
                        )
                  : ipath != ''
                      ? Image.asset('assets/icons/income/${ipath}.png')
                      : Image.asset('assets/icons/profits.png'),
              space(Hi: 0, Wi: 25),
              ShaderMask(
                shaderCallback: (Rect rect) {
                  return LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.cyanAccent,
                    Colors.white,
                  ]).createShader(rect);
                },
                child: Container(
                  width: wid * 0.36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(
                        '${name.toUpperCase()}',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: wid * 0.27,
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/rupee.png',
                  width: wid * 0.07,
                ),
                space(Hi: 0, Wi: wid * 0.03),
                SizedBox(
                  width: wid * 0.15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(amount,
                          style: TextStyle(
                              color: eori == 'expence'
                                  ? Colors.pinkAccent.shade400
                                  : Colors.greenAccent,
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                    color: eori == 'expence'
                                        ? Colors.pinkAccent.shade200
                                        : Colors.greenAccent,
                                    blurRadius: 5)
                              ],
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
