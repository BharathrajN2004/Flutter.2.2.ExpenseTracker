// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, unused_import, sort_child_properties_last

import 'dart:io';
import '/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import '/Transaction.dart';
import '/color/colors.dart';
import 'data/boxes.dart';
import 'home/homecard.dart';
import 'home/homechart.dart';
import 'table/table.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var f = 0;

  final LinearGradient _graidant =
      LinearGradient(colors: [Colors.lightBlueAccent, Colors.cyanAccent]);

  var p = 0;
  var hari = 0;
  final box = Boxes.getTrans();
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var task = MediaQuery.of(context).viewPadding.top;
    var hei = MediaQuery.of(context).size.height - task;
    var wid = MediaQuery.of(context).size.width;
    Future<bool> showExitPopup() async {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 18, 29, 40),
              content: Container(
                height: hei * 0.15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do you want to exit?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: hei * 0.025),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  exit(0);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.lightBlueAccent,
                                            blurRadius: 12)
                                      ],
                                      color: Colors.cyanAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 8),
                                  child: Center(
                                      child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ))),
                        SizedBox(width: wid * 0.1),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.lightBlueAccent,
                                            blurRadius: 12)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 8),
                                  child: Center(
                                      child: Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ))),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }

    return WillPopScope(
      onWillPop: () => showExitPopup(),
      child: Scaffold(
        // app bar
        appBar: homeappbar(hei, wid, context, _graidant),
        body: Container(
          color: Color.fromARGB(255, 18, 29, 40),
          child: potrait(),
        ),

        // action button
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: floatingicon(),
      ),
    );
  }

// potrait
  Widget potrait() => Column(
        children: [
          home1chard(),
          Expanded(
              child: GestureDetector(
                  onHorizontalDragStart: (details) {
                    setState(() {
                      hari == 0 ? hari = 1 : hari = 0;
                    });
                  },
                  onVerticalDragStart: (details) {
                    setState(() {
                      p == 0 ? p = 1 : p = 0;
                    });
                  },
                  child: p == 0
                      ? hari == 0
                          ? homechart(
                              pass: p,
                              hari: hari,
                            )
                          : homechart(
                              pass: p,
                              hari: hari,
                            )
                      : box.length != 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                homechart(
                                  pass: p,
                                  hari: hari,
                                ),
                                table(),
                              ],
                            )
                          : homechart(pass: p, hari: hari))),
        ],
      );
}

// appbar
//
AppBar homeappbar(
    double hei, double wid, BuildContext context, LinearGradient _graidant) {
  return AppBar(
    toolbarHeight: hei * .125,
    centerTitle: true,
    leadingWidth: wid * 0.4,
    leading: Image.asset(
      'assets/icons/BeWise logo.png',
    ),
    title: ShaderMask(
      shaderCallback: (Rect rect) {
        return _graidant.createShader(rect);
      },
      child: Shimmer.fromColors(
        period: Duration(seconds: 1),
        direction: ShimmerDirection.ltr,
        baseColor: Colors.lightBlueAccent,
        highlightColor: Colors.cyanAccent,
        child: Text(
          'BeWise',
          style: TextStyle(
            fontSize: 35,
            shadows: [
              Shadow(
                color: Colors.lightBlueAccent,
                blurRadius: 60,
                // offset: Offset(4, 4),
              ),
            ],
          ),
        ),
      ),
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: Color.fromARGB(255, 18, 29, 40),
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 13, 21, 29),
                // Color.fromARGB(255, 31, 44, 56),
                Color.fromARGB(255, 46, 55, 68),
              ])),
    ),
  );
}

// floatingaction button
//
class floatingicon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Transaction())),
      child: Container(
        width: 40,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(.7), blurRadius: 30)
        ]),
        child: Image.asset("assets/icons/Transaction.png"),
      ),
    );
  }
}
