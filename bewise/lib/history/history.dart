// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import '../adds/helper.dart';
import '/color/colors.dart';
import 'package:shimmer/shimmer.dart';

import '../minorComponents/sizedBox.dart';
import '../trans/hischart.dart';
import '/Transaction.dart';
import '/data/hboxes.dart';
import '/data/history.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../data/boxes.dart';
import '../data/tdata.dart';
import '../trans/exchard.dart';

class historypage extends StatefulWidget {
  @override
  State<historypage> createState() => _historypageState();
}

class _historypageState extends State<historypage> {
  BannerAd? _banner;
  void initState() {
    // TODO: implement initState
    super.initState();
    _createBanner();
  }

  void _createBanner() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: Admobservice.bannerAdUnitId!,
        listener: Admobservice.bannerListener,
        request: AdRequest())
      ..load();
  }

  late Animation<double> animation;
  var e = 0;
  final tbox = Boxes.getTrans();
  final hbox = HBoxes.getTrans();
  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    var wid = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Transaction()));
        return Future.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: Platform.isAndroid
            ? _banner == null
                ? Container()
                : Container(
                    margin: EdgeInsets.only(bottom: 12),
                    height: 50,
                    child: AdWidget(
                      ad: _banner!,
                    ),
                  )
            : SizedBox(),
        body: Container(
          color: Color.fromARGB(255, 18, 29, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              space(Hi: MediaQuery.of(context).viewPadding.top + 15, Wi: 0),
              Shimmer.fromColors(
                period: Duration(seconds: 1),
                direction: ShimmerDirection.ltr,
                baseColor: Colors.lightBlueAccent,
                highlightColor: Colors.cyanAccent,
                child: Text(
                  'H I S T O R Y',
                  style: TextStyle(
                      fontSize: wid * 0.055,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(color: Colors.cyanAccent, blurRadius: 20)
                      ],
                      color: Color(0xFF40C4FF)),
                ),
              ),
              space(Hi: hei * 0.02, Wi: 0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Transaction()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffff00e5ff).withOpacity(.6),
                              Color(0xffff1200ff).withOpacity(.6),
                            ]),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffff00e5ff),
                              offset: Offset(-1, -1),
                              blurRadius: 10),
                          BoxShadow(
                              color: Color(0xffff1200ff),
                              offset: Offset(1, 1),
                              blurRadius: 10)
                        ]),
                    child: Icon(Icons.add_chart_outlined, color: Colors.white),
                  ),
                ),
                ShaderMask(
                  shaderCallback: (Rect rect) {
                    return LinearGradient(colors: [
                      Color(0xffff00e1fd),
                      Color(0xfffffc007a),
                    ]).createShader(rect);
                  },
                  child: Text(
                    'RECENTLY DELETED',
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Color(0xffff00e1fd),
                              offset: Offset(-1, -1),
                              blurRadius: 16),
                          Shadow(
                              color: Color(0xfffffc007a),
                              offset: Offset(1, 1),
                              blurRadius: 16)
                        ],
                        fontSize: wid * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    hbox.clear();
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffff00e5ff).withOpacity(.6),
                              Color(0xffff1200ff).withOpacity(.6),
                            ]),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffff00e5ff),
                              offset: Offset(-1, -1),
                              blurRadius: 10),
                          BoxShadow(
                              color: Color(0xffff1200ff),
                              offset: Offset(1, 1),
                              blurRadius: 10)
                        ]),
                    child: Icon(Icons.clear_all_rounded, color: Colors.white),
                  ),
                ),
              ]),
              //
              //
              //
              //
              //
              //
              hbox.length != 0
                  ? Container(
                      margin: EdgeInsets.only(
                          top: hei * 0.02,
                          // bottom: hei * 0.005,
                          right: wid * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          e == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: wid * 0.1, bottom: 5),
                                      child: Text(
                                        'SCROLL TO RESTORE',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 1.3),
                                      ),
                                    ),
                                    Text(
                                      'DOUBLE TAP TO DELETE',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          letterSpacing: 1.3),
                                    ),
                                  ],
                                )
                              : space(Hi: 0, Wi: 0),
                          GestureDetector(
                            onTap: () => setState(() {
                              e == 0 ? e = 1 : e = 0;
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: e == 0
                                            ? Colors.yellowAccent
                                                .withOpacity(.65)
                                            : Colors.transparent,
                                        blurRadius: 16)
                                  ]),
                              margin: EdgeInsets.only(left: 10),
                              // ignore: sort_child_properties_last
                              child: Image.asset('assets/icons/reference.png'),
                              width: 35,
                            ),
                          )
                        ],
                      ),
                    )
                  : space(Hi: 0, Wi: 0),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: wid * .05),
                child: ValueListenableBuilder<Box<history>>(
                  valueListenable: HBoxes.getTrans().listenable(),
                  builder: (context, box, _) {
                    final trans = box.values.toList().cast<history>();
                    return ListView.builder(
                      itemCount: trans.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onHorizontalDragStart: (d) {
                            setState(() {
                              box.delete(trans[index].key);
                              tbox.add(tdata(
                                  eori: trans[index].eori,
                                  name: trans[index].name,
                                  ipath: trans[index].ipath,
                                  amount: trans[index].amount));
                            });
                          },
                          onDoubleTap: () => box.delete(trans[index].key),
                          child: Exdata(
                              eori: trans[index].eori,
                              name: trans[index].name,
                              ipath: trans[index].ipath,
                              amount: trans[index].amount),
                        );
                      },
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
