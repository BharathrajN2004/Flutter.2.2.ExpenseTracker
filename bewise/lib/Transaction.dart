// ignore_for_file: file_names, prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, use_full_hex_values_for_flutter_colors, dead_code

import 'dart:io';
import 'dart:ui';

import '/adds/helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/color/colors.dart';
import '/trans/exchard.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '/data/hboxes.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/data/boxes.dart';
import '/data/tdata.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
// import 'package:slide_to_act/slide_to_act.dart';

import 'Home.dart';
import 'data/history.dart';
import 'history/history.dart';
import 'minorComponents/sizedBox.dart';
import 'model/catdata.dart';
import 'trans/addbutton.dart';

class Transaction extends StatefulWidget {
  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  late BannerAd _banner;

  final mybox = Hive.box<tdata>('tdatadb');
  List cat = [
    data(path: 'education', name: 'Education'),
    data(path: 'healthcare', name: 'HealthCare'),
    data(path: 'bill', name: 'Bills'),
    data(path: 'food', name: 'Food'),
    data(path: 'ent', name: 'Entertainment'),
    data(path: 'housing', name: 'Housing'),
    data(path: 'insurance', name: 'Insurance'),
    data(path: 'travel', name: 'Travel'),
    data(path: 'grocery', name: 'Grocery'),
    data(path: 'cloth', name: 'Clothes'),
    data(path: 'car', name: 'Gasoline'),
  ];
  List inc = [
    data(path: 'business', name: 'Business'),
    data(path: 'investment', name: 'Investment'),
    data(path: 'rental', name: 'Rental'),
    data(path: 'salary', name: 'Salary'),
    data(path: 'intrest', name: 'Interest'),
  ];

  // void dispose() {
  //   Hive.box('tdatadb').close();
  // }

  var index = 0;

  late bool posi = false;

  late String name = '';

  late String amount = '';
  final box = Boxes.getTrans();
  final hbox = HBoxes.getTrans();
  final listkey = GlobalKey<AnimatedListState>();
  var e = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createBanner();
  }

  _createBanner() {
    _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: Admobservice.bannerAdUnitId!,
        listener: Admobservice.bannerListener,
        request: AdRequest())
      ..load();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    var width = MediaQuery.of(context).size.width;
    //
    // potrait
    void potnewtrans() => potnewDialog(context, height, width);
    //
    void potcattrans(String pathi) =>
        potcatDialog(context, height, pathi, width);
    //
    void potinctrans(String pathi) =>
        potincDialog(context, height, pathi, width);
    //
    void move() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    }

//
    return WillPopScope(
      onWillPop: () {
        move();
        return Future<bool>.value(true);
      },
      child: Scaffold(
        bottomNavigationBar: Platform.isAndroid
            ? _banner == null
                ? Container(
                    color: Colors.red,
                    child: Center(
                      child: Text('Hello World  '),
                    ))
                : Container(
                    margin: EdgeInsets.only(bottom: 12),
                    height: 50,
                    // color: Colors.blue,
                    child:
                        // Center(
                        //   child: Text('Hello world'),
                        // )
                        AdWidget(
                      ad: _banner,
                    ),
                  )
            : SizedBox(),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromARGB(255, 18, 29, 40),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                space(Hi: MediaQuery.of(context).viewPadding.top + 15, Wi: 0),
                Shimmer.fromColors(
                  period: Duration(seconds: 1),
                  direction: ShimmerDirection.ltr,
                  baseColor: Colors.lightBlueAccent,
                  highlightColor: Colors.cyanAccent,
                  child: Text(
                    'T R A N S A C T I O N S',
                    style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(color: Colors.cyanAccent, blurRadius: 20)
                        ],
                        color: Color(0xFF40C4FF)),
                  ),
                ),
                space(Hi: height * 0.012, Wi: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
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
                        child: Icon(Icons.home, color: Colors.white),
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
                        'COMMON CATEGORIES',
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
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    hbox.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => historypage()));
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
                                        Color(0xffff00e5ff),
                                        Color(0xFFFF1200FF),
                                      ]),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffff00e5ff),
                                        offset: Offset(-1, -1),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Color(0xFFFF1200FF),
                                        offset: Offset(1, 1),
                                        blurRadius: 10)
                                  ]),
                              child: Icon(Icons.history, color: Colors.white),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )
                  ],
                ),
                space(
                  Hi: height * 0.03,
                  Wi: 0,
                ),
                //
                //
                //
                //
                //
                // monthList
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height * 0.05,
                      width: width * 0.75,
                      // color: Colors.blue.shade300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cat.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () => potcattrans(cat[index].path),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(.1)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent.withOpacity(.3),
                                      Colors.cyanAccent.withOpacity(.1)
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.all(7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      'assets/icons/expence/${cat[index].path}.png',
                                      height: 40,
                                    ),
                                    space(Hi: 0, Wi: 5),
                                    ShaderMask(
                                      shaderCallback: (Rect rect) {
                                        return LinearGradient(colors: [
                                          Color(0xFF00FFED),
                                          Color(0xFF6EE2FB)
                                        ]).createShader(rect);
                                      },
                                      child: Text(
                                        '${cat[index].name}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    //
                    //
                    //
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      child: Text(
                        'EXPENSE',
                        style: TextStyle(
                            color: Colors.pinkAccent.shade200,
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                  color: Colors.pink.shade300, blurRadius: 12)
                            ],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                space(
                  Hi: height * 0.02,
                  Wi: 0,
                ),

                //
                //
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        'INCOME',
                        style: TextStyle(
                            color: Colors.greenAccent.shade400,
                            shadows: [
                              Shadow(
                                  color: Colors.greenAccent.shade200,
                                  blurRadius: 12)
                            ],
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.75,
                      // color: Colors.blue.shade300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: inc.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  potinctrans(inc[index].path);
                                  print(inc[index].path);
                                });
                              },

                              //
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.white.withOpacity(.1)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightBlueAccent.withOpacity(.3),
                                      Colors.cyanAccent.withOpacity(.1)
                                    ],
                                  ),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      'assets/icons/income/${inc[index].path}.png',
                                      height: 40,
                                    ),
                                    space(Hi: 0, Wi: 10),
                                    ShaderMask(
                                      shaderCallback: (Rect rect) {
                                        return LinearGradient(colors: [
                                          Color(0xFF00FFED),
                                          Color(0xFF6EE2FB)
                                        ]).createShader(rect);
                                      },
                                      child: Text(
                                        '${inc[index].name}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                //
                //
                //

                //

                box.length != 0
                    ? Container(
                        margin: EdgeInsets.only(
                            top: height * 0.03,
                            bottom: height * 0.015,
                            right: width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            e == 0
                                ? Text(
                                    'LONG PRESS TO DELETE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 1.3),
                                  )
                                : Text(""),
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
                                child:
                                    Image.asset('assets/icons/reference.png'),
                                width: 35,
                              ),
                            )
                          ],
                        ),
                      )
                    : space(Hi: height * 0.05, Wi: 0),
                Container(
                  margin: EdgeInsets.only(
                      left: width * 0.08, right: width * 0.08, bottom: 15),
                  height: height * 0.7,
                  child: ValueListenableBuilder<Box<tdata>>(
                    valueListenable: Boxes.getTrans().listenable(),
                    builder: (context, box, _) {
                      final trans = box.values.toList().cast<tdata>();
                      index = box.length;
                      return trans.isNotEmpty
                          ? AnimatedList(
                              scrollDirection: Axis.vertical,
                              key: listkey,
                              initialItemCount: trans.length,
                              itemBuilder: (context, index, animation) =>
                                  GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    final history to = history(
                                        eori: trans[index].eori,
                                        name: trans[index].name,
                                        ipath: trans[index].ipath,
                                        amount: trans[index].amount);

                                    box.delete(trans[index].key);
                                    // index = box.length;
                                    listkey.currentState!.removeItem(
                                        index,
                                        duration: Duration(milliseconds: 600),
                                        (context, animation) => Expence_data(
                                              eori: trans[index].eori,
                                              name: trans[index].name,
                                              ipath: trans[index].ipath,
                                              amount: trans[index].amount,
                                              animation: animation,
                                            ));
                                    hbox.add(
                                      to,
                                    );
                                  });
                                  print(trans.length);
                                  print(hbox.length);
                                },
                                child: Expence_data(
                                    animation: animation,
                                    eori: trans[index].eori,
                                    name: trans[index].name,
                                    ipath: trans[index].ipath,
                                    amount: trans[index].amount),
                              ),
                            )
                          : Column(
                              children: [
                                Lottie.asset('assets/json/empty.json',
                                    height: height * 0.4),
                                space(Hi: 15, Wi: 0),
                                Text(
                                  'Your Transaction  data  is  empty, \n        Add some transaction',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: addbutton(
          function: potnewtrans,
        ),
      ),
    );
  }

//
//
//
//
//
//
//
// potrait
  Future<dynamic> potnewDialog(
      BuildContext context, double height, double width) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 29, 40),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  space(Hi: 10, Wi: 0),
                  Shimmer.fromColors(
                    baseColor: Colors.pinkAccent.shade200,
                    highlightColor: Colors.orangeAccent,
                    period: Duration(seconds: 1),
                    child: Text(
                      'NEW TRANSACTION',
                      style: TextStyle(
                          color: Colors.pinkAccent.shade200,
                          shadows: [
                            Shadow(
                                color: Colors.pinkAccent.shade200,
                                blurRadius: 12)
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  space(Hi: 10, Wi: 0),
                  Center(
                    child: SizedBox(
                      width: 138,
                      height: 42,
                      child: LiteRollingSwitch(
                        value: posi,
                        textOn: 'INCOME',
                        animationDuration: Duration(milliseconds: 500),
                        textOff: 'EXPENCE',
                        colorOn: Colors.pinkAccent.shade200,
                        colorOff: Colors.lightBlue,
                        iconOn: Icons.arrow_back,
                        iconOff: Icons.arrow_forward,
                        textOffColor: Colors.white,
                        textOnColor: Colors.white,
                        textSize: 18,
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        onChanged: (bool position) {
                          posi = position;
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent)),
                        hintText: 'TRANSACTION NAME',
                        hintStyle: TextStyle(color: Colors.cyanAccent),
                        icon: Image.asset(
                          'assets/icons/new.png',
                          height: 40,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        name = value.toString();
                        print(name);
                      }),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        hintText: 'AMOUNT',
                        hintStyle: TextStyle(color: Colors.yellow),
                        icon: Image.asset(
                          'assets/icons/rupee.png',
                          height: 40,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        amount = value.toString();
                        print(amount);
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            if (name != '' && amount != '') {
                              box.add(tdata(
                                  name: name,
                                  amount: amount,
                                  ipath: '',
                                  eori: posi == false ? 'expence' : 'income'));
                              listkey.currentState!.insertItem(index,
                                  duration: Duration(milliseconds: 600));
                              name = '';
                              amount = '';
                            }
                            ;
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Transaction(),
                                ));

                            name = '';
                            amount = '';
                            print(hbox.length);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.cyanAccent.withOpacity(.45),
                                    blurRadius: 15)
                              ]),
                          margin: EdgeInsets.only(
                              top: height * 0.005, right: width * 0.04),
                          child: Image.asset(
                            'assets/icons/addtran.png',
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  //
  //
  //
  //
  //
  //
  // potraitcatdialog
  Future<dynamic> potcatDialog(
      BuildContext context, double height, String pathi, double width) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 29, 40),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  space(Hi: height * 0.04, Wi: 0),
                  Shimmer.fromColors(
                    baseColor: Colors.pinkAccent.shade200,
                    highlightColor: Colors.orangeAccent,
                    period: Duration(seconds: 1),
                    child: Text(
                      'NEW TRANSACTION',
                      style: TextStyle(
                          color: Colors.pinkAccent.shade200,
                          shadows: [
                            Shadow(
                                color: Colors.pinkAccent.shade200,
                                blurRadius: 12)
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  space(Hi: 10, Wi: 0),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent)),
                        hintText: 'TRANSACTION NAME',
                        hintStyle: TextStyle(color: Colors.cyanAccent),
                        icon: Image.asset(
                          'assets/icons/expence/${pathi}.png',
                          height: 40,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        name = value.toString();
                      }),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        hintText: 'AMOUNT',
                        hintStyle: TextStyle(color: Colors.yellow),
                        icon: Image.asset(
                          'assets/icons/rupee.png',
                          height: 40,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        amount = value.toString();
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            if (name != '' && amount != '') {
                              box.add(tdata(
                                  name: name,
                                  amount: amount,
                                  ipath: '${pathi}',
                                  eori: 'expence'));
                              listkey.currentState!.insertItem(index,
                                  duration: Duration(milliseconds: 600));
                              name = '';
                              amount = '';
                              Navigator.pop(context);
                            }
                            name = '';
                            amount = '';
                            Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Transaction(),
                            //     ));
                            print(box.length);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.cyanAccent.withOpacity(.45),
                                    blurRadius: 15)
                              ]),
                          margin: EdgeInsets.only(
                              top: height * 0.005, right: width * 0.04),
                          child: Image.asset(
                            'assets/icons/addtran.png',
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }

  //
  //
  //
  //
  //
  //
  //
  Future<dynamic> potincDialog(
      BuildContext context, double height, String pathi, double width) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 18, 29, 40),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  space(Hi: height * 0.04, Wi: 0),
                  Shimmer.fromColors(
                    baseColor: Colors.pinkAccent.shade200,
                    highlightColor: Colors.orangeAccent,
                    period: Duration(seconds: 1),
                    child: Text(
                      'NEW TRANSACTION',
                      style: TextStyle(
                          color: Colors.pinkAccent.shade200,
                          shadows: [
                            Shadow(
                                color: Colors.pinkAccent.shade200,
                                blurRadius: 12)
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  space(Hi: 10, Wi: 0),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyanAccent)),
                        hintText: 'TRANSACTION NAME',
                        hintStyle: TextStyle(color: Colors.cyanAccent),
                        icon: Image.asset(
                          'assets/icons/income/${pathi}.png',
                          height: 40,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        name = value.toString();
                      }),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        hintText: 'AMOUNT',
                        hintStyle: TextStyle(color: Colors.yellow),
                        icon: Image.asset(
                          'assets/icons/rupee.png',
                          height: 40,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        amount = value.toString();
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            if (name != '' && amount != '') {
                              box.add(tdata(
                                  name: name,
                                  amount: amount,
                                  ipath: '${pathi}',
                                  eori: 'income'));

                              listkey.currentState!.insertItem(index,
                                  duration: Duration(milliseconds: 600));
                              name = '';
                              amount = '';
                              Navigator.pop(context);
                            }
                            Navigator.pop(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Transaction(),
                            //     ));
                            name = '';
                            amount = '';
                            print(box.length);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.cyanAccent.withOpacity(.45),
                                    blurRadius: 15)
                              ]),
                          margin: EdgeInsets.only(
                              top: height * 0.005, right: width * 0.04),
                          child: Image.asset(
                            'assets/icons/addtran.png',
                            height: 45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        });
  }
}
