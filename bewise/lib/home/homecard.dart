// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, camel_case_types, unused_import

import 'dart:ui';

import '/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../data/boxes.dart';
import '../data/tdata.dart';
import '../minorComponents/linear_bar.dart';

class home1chard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;
    return ValueListenableBuilder<Box<tdata>>(
        valueListenable: Boxes.getTrans().listenable(),
        builder: (context, box, _) {
          final linedata = box.values.toList().cast<tdata>();
          var exp = 0, inc = 0;
          for (var t in linedata) {
            if (t.eori == 'expence') {
              exp += int.parse(t.amount);
            }
            if (t.eori == 'income') {
              inc += int.parse(t.amount);
            }
          }
          var per = 1.0;
          if (inc != 0 && exp == 0) {
            per = 1;
          } else if (inc == 0 && exp != 0) {
            per = 0;
          } else if (inc > exp) {
            per = (1 - (exp) / inc);
          }
          return Container(
            height: hei * 0.25,
            margin: EdgeInsets.symmetric(
                horizontal: wid * 0.05, vertical: hei * .02),
            padding: EdgeInsets.symmetric(
                horizontal: wid * 0.05, vertical: hei * .025),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.deepPurple.shade50,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 0, 233, 254).withBlue(240),
                  Color(0xFF6956ec).withAlpha(170),
                  // Color(0xFF6956ec).withOpacity(.7)
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 0, 233, 254)
                        .withBlue(240)
                        .withOpacity(.3),
                    offset: Offset(2, 2),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Color(0xFF6956ec).withAlpha(170).withOpacity(.6),
                    offset: Offset(-2.0, -2.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ],
            ),
            child: Center(
              // main column

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // balance row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: hei * 0.05,
                        child: Image.asset('assets/icons/balance.png'),
                      ),
                      SizedBox(width: wid * 0.005),

                      // column for balance and price
                      Column(
                        children: [
                          Text(
                            'B A L A N C E',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: wid * .05,
                                fontWeight: FontWeight.w800),
                          ),

                          // row to maintain rupees and value
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                height: wid * 0.06,
                                child: Image.asset('assets/icons/rupee.png'),
                              ),
                              SizedBox(
                                width: wid * .009,
                              ),
                              Container(
                                width: wid * 0.3,
                                height: hei * .03,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Text(
                                      "${inc - exp}",
                                      style: TextStyle(
                                          color: Colors.cyanAccent,
                                          fontSize: wid * .055,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // end of row to maintain rupees and value
                        ],
                      ),
                      // end of column for balance and price
                    ],
                  ),
                  // end of balance row
                  SizedBox(
                    height: hei * .015,
                  ),
                  // income row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: wid * .1,
                              child: Image.asset('assets/icons/up.png')),
                          Column(
                            children: [
                              Text("INCOME",
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: wid * 0.0325,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: hei * .005,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: wid * .06,
                                    child: Image.asset(
                                        'assets/icons/rupeegre.png'),
                                  ),
                                  SizedBox(
                                    width: wid * .015,
                                  ),
                                  Container(
                                    width: wid * 0.2,
                                    height: hei * .03,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Text(
                                          "${inc}",
                                          style: TextStyle(
                                              color: income,
                                              fontSize: wid * 0.05,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      // end of income row

                      // expence row
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("EXPENSE",
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: wid * .0325,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: hei * 0.005,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: wid * .06,
                                      child: Image.asset(
                                          'assets/icons/rupeered.png'),
                                    ),
                                    SizedBox(
                                      width: wid * 0.015,
                                    ),
                                    Container(
                                      width: wid * 0.15,
                                      height: hei * .03,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Text(
                                            "${exp}",
                                            style: TextStyle(
                                                color:
                                                    Colors.redAccent.shade400,
                                                fontSize: wid * .05,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: wid * 0.1,
                              child: Image.asset('assets/icons/down.png'))
                        ],
                      )
                      // end of expence row
                    ],
                  ),
                  SizedBox(
                    height: hei * 0.02,
                  ),
                  // liner progress bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'BALANCE',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        width: wid * 0.45,
                        child: linear_bar(per),
                      ),
                      Text(
                        'EXPENSE',
                        style: TextStyle(
                            color: Colors.pinkAccent.shade100,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
              // main column
            ),
          );
        });
  }
}
