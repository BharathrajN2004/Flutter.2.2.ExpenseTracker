// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import '/minorComponents/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../color/colors.dart';
import '../data/boxes.dart';
import '../data/tdata.dart';

class table extends StatefulWidget {
  const table({super.key});

  @override
  State<table> createState() => _tableState();
}

class _tableState extends State<table> {
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Container(
      height: hei * 0.18,
      child: ValueListenableBuilder<Box<tdata>>(
        valueListenable: Boxes.getTrans().listenable(),
        builder: (context, box, _) {
          final trans = box.values.toList().cast<tdata>();
          return Container(
            height: hei * 0.18,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'INCOME',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Text('EXPENSE',
                          style: TextStyle(
                              color: Colors.pink.shade500,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: hei * 0.15,
                      width: wid * 0.4,
                      child: ListView.builder(
                        itemCount: trans.length,
                        itemBuilder: (context, index) => trans[index].eori ==
                                'income'
                            ? Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    Container(
                                      width: wid * 0.35,
                                      height: hei * .03,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Text(
                                            trans[index].name.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : space(Hi: 0, Wi: 0),
                      ),
                    ),
                    space(Hi: 0, Wi: wid * 0.05),
                    Container(
                      height: hei * 0.15,
                      width: wid * 0.4,
                      child: ListView.builder(
                        itemCount: trans.length,
                        itemBuilder: (context, index) => trans[index].eori ==
                                'expence'
                            ? Container(
                                margin: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.pink.shade500,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    Container(
                                      width: wid * 0.35,
                                      height: hei * .03,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Text(
                                            trans[index].name.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : space(Hi: 0, Wi: 0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.only(left: wid * 0.045),
          //       width: wid * 0.45,
          //       child: Column(
          //         children: [
          //           Text(
          //             'INCOME',
          //             style: TextStyle(
          //                 color: Colors.greenAccent,
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w600),
          //           ),
          //           Container(
          //             height: hei * 0.096,
          //             padding: EdgeInsets.symmetric(
          //                 vertical: hei * 0.01, horizontal: wid * 0.1),
          //             child: ListView.builder(
          //                 itemCount: trans.length,
          // itemBuilder: (context, index) => trans[index].eori ==
          //         'income'
          //     ? Container(
          //         margin: EdgeInsets.only(bottom: 6),
          //         width: wid * 0.2,
          //         child: Row(
          //           children: [
          //             Container(
          //               margin: EdgeInsets.only(right: 10),
          //               width: 6,
          //               height: 6,
          //               decoration: BoxDecoration(
          //                   color: Colors.greenAccent,
          //                   borderRadius:
          //                       BorderRadius.circular(50)),
          //             ),
          //             Container(
          //               width: wid * 0.18,
          //               height: hei * .03,
          //               child: ListView(
          //                 scrollDirection: Axis.horizontal,
          //                 children: [
          //                   Text(
          //                     trans[index].name.toUpperCase(),
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w700),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //                           ],
          //                         ),
          //                       )
          //                     : space(Hi: 0, Wi: 0)),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       margin: EdgeInsets.only(right: wid * 0.055),
          //       width: wid * 0.45,
          //       child: Column(
          //         children: [
          //           Text('EXPENSE',
          //               style: TextStyle(
          //                   color: Colors.pink.shade500,
          //                   fontSize: 15,
          //                   fontWeight: FontWeight.w600)),
          //           Container(
          //             padding: EdgeInsets.symmetric(
          //                 vertical: hei * 0.01, horizontal: wid * 0.1),
          //             height: hei * 0.096,
          //             child: ListView.builder(
          //                 itemCount: trans.length,
          // itemBuilder: (context, index) => trans[index].eori ==
          //         'expence'
          //     ? Container(
          //         margin: EdgeInsets.only(bottom: 6),
          //         child: Row(
          //           children: [
          //             Container(
          //               margin: EdgeInsets.only(right: 10),
          //               width: 6,
          //               height: 6,
          //               decoration: BoxDecoration(
          //                   color: Colors.pink.shade500,
          //                   borderRadius:
          //                       BorderRadius.circular(50)),
          //             ),
          //             Container(
          //               width: wid * 0.18,
          //               height: hei * .03,
          //               child: ListView(
          //                 scrollDirection: Axis.horizontal,
          //                 children: [
          //                   Text(
          //                     trans[index].name.toUpperCase(),
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 15,
          //                         fontWeight: FontWeight.w700),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     : space(Hi: 0, Wi: 0)),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // );
        },
      ),
    );
  }
}
