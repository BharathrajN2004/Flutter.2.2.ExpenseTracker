// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'dart:ui';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import '/data/boxes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/tdata.dart';

class homechart extends StatefulWidget {
  final int pass;
  final int hari;
  homechart({required this.pass, required this.hari});
  State<homechart> createState() => _homechartState();
}

class _homechartState extends State<homechart> {
  late TooltipBehavior _tooltip;
  final randomnumber = Random().nextInt(255);
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

//
  final box = Boxes.getTrans();
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    return box.isNotEmpty
        ? ValueListenableBuilder<Box<tdata>>(
            valueListenable: Boxes.getTrans().listenable(),
            builder: (context, box, _) {
              final linedata = box.values.toList().cast<tdata>();
              var max = linedata.first;
              final List<tdata> expence = [];
              final List<tdata> income = [];
              var totalexp = 0;
              var totalinc = 0;
              if (linedata.isNotEmpty) {
                linedata.forEach((data) {
                  if (int.parse(data.amount) > int.parse(max.amount)) {
                    max = data;
                  }
                  if (data.eori == 'expence') {
                    expence.add(data);
                    totalexp += int.parse(data.amount);
                  } else {
                    income.add(data);
                    totalinc += int.parse(data.amount);
                  }
                });
              }
              return widget.hari == 0 && widget.pass == 0
                  ? totalexp != 0
                      ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: Text(
                                    'Expense chart'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          Shadow(
                                              color: Colors.pinkAccent.shade200,
                                              blurRadius: 20)
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            SfCircularChart(
                              tooltipBehavior: _tooltip,
                              series: <CircularSeries>[
                                DoughnutSeries<tdata, String>(
                                    // gap: '6',
                                    dataSource: expence,
                                    explodeAll: true,
                                    // cornerStyle: CornerStyle.bothCurve,
                                    // trackColor: Colors.transparent,
                                    // innerRadius: linedata.length > 5 ? '50' : '90',
                                    // radius: (wid * .35).toString(),
                                    xValueMapper: (tdata data, _) => data.name,
                                    yValueMapper: (tdata data, _) =>
                                        int.parse(data.amount),
                                    opacity: .8,
                                    dataLabelSettings: DataLabelSettings(
                                      isVisible: true,
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    dataLabelMapper: (datum, index) =>
                                        datum.name,
                                    animationDelay: 200,
                                    enableTooltip: true,
                                    innerRadius: '50',
                                    // maximumValue: double.parse(max.amount) + 20,
                                    animationDuration: 2000)
                              ],
                            ),
                            totalexp != 0
                                ? Center(
                                    child: DelayedDisplay(
                                      delay: Duration(seconds: 2),
                                      fadingDuration: Duration(seconds: 1),
                                      slidingBeginOffset: Offset(.5, 0),
                                      child: Container(
                                        width: wid * 0.15,
                                        margin: EdgeInsets.only(
                                            left: wid * 0.015,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.26),
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Text(
                                              totalexp.toString(),
                                              style: TextStyle(
                                                  color: Colors.cyanAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Text('')
                          ],
                        )
                      : Column(
                          children: [
                            Text(
                              'EXPENSE DATA NOT FOUND',
                              style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  shadows: [
                                    Shadow(
                                        color: Colors.pinkAccent.shade200,
                                        blurRadius: 20)
                                  ]),
                            ),
                            Lottie.asset('assets/json/notfound.json'),
                          ],
                        )
                  : widget.hari == 1 && widget.pass == 0
                      ? totalinc != 0
                          ? Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: Text(
                                        'Income chart'.toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            shadows: [
                                              Shadow(
                                                  color: Colors.greenAccent,
                                                  blurRadius: 20)
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                                SfCircularChart(
                                  tooltipBehavior: _tooltip,
                                  series: <CircularSeries>[
                                    DoughnutSeries<tdata, String>(
                                        dataSource: income,
                                        explodeAll: true,
                                        // cornerStyle: CornerStyle.bothCurve,
                                        // trackColor: Colors.transparent,
                                        // innerRadius: linedata.length > 5 ? '50' : '90',
                                        // radius: (wid * .35).toString(),
                                        xValueMapper: (tdata data, _) =>
                                            data.name,
                                        yValueMapper: (tdata data, _) =>
                                            int.parse(data.amount),
                                        opacity: .8,
                                        dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        dataLabelMapper: (datum, index) =>
                                            datum.name,
                                        animationDelay: 200,
                                        enableTooltip: true,
                                        innerRadius: '50',
                                        // maximumValue: double.parse(max.amount) + 20,
                                        animationDuration: 2000)
                                  ],
                                ),
                                totalinc != 0
                                    ? Center(
                                        child: DelayedDisplay(
                                          delay: Duration(seconds: 2),
                                          fadingDuration: Duration(seconds: 1),
                                          slidingBeginOffset: Offset(.5, 0),
                                          child: Container(
                                            width: wid * 0.1,
                                            margin: EdgeInsets.only(
                                                left: wid * 0.015,
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.26),
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Text(
                                                  totalinc.toString(),
                                                  style: TextStyle(
                                                      color: Colors.cyanAccent,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text('')
                              ],
                            )
                          : Column(
                              children: [
                                Text(
                                  'INNCOME DATA NOT FOUND',
                                  style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      shadows: [
                                        Shadow(
                                            color: Colors.greenAccent,
                                            blurRadius: 20)
                                      ]),
                                ),
                                Lottie.asset('assets/json/notfound.json'),
                              ],
                            )
                      :
                      //
                      //
                      //
                      //
                      //
                      Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 20),
                                  child: Text(
                                    'Expense and Income chart'.toUpperCase(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 109, 208, 253),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          Shadow(
                                              color: Colors.lightBlueAccent,
                                              blurRadius: 20)
                                        ]),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.06,
                              ),
                              height: MediaQuery.of(context).size.height * 0.36,
                              child: SfCircularChart(
                                tooltipBehavior: _tooltip,
                                series: <CircularSeries>[
                                  PieSeries<tdata, String>(
                                      dataSource: linedata,
                                      explodeAll: true,
                                      // cornerStyle: CornerStyle.bothCurve,
                                      // trackColor: Colors.transparent,
                                      // innerRadius: linedata.length > 5 ? '50' : '90',
                                      // radius: (wid * .35).toString(),
                                      xValueMapper: (tdata data, _) =>
                                          data.name,
                                      yValueMapper: (tdata data, _) =>
                                          int.parse(data.amount),
                                      opacity: .8,
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      dataLabelMapper: (datum, index) =>
                                          datum.name,
                                      animationDelay: 200,
                                      enableTooltip: true,
                                      // maximumValue: double.parse(max.amount) + 20,
                                      animationDuration: 2000)
                                ],
                              ),
                            ),
                          ],
                        );
            })
        : Lottie.asset('assets/json/nodata.json');
  }
}
//
//
//
// column series
