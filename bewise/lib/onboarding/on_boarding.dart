// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../Home.dart';
import '/minorComponents/sizedBox.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/onboarding/ondata.dart';

class onboard extends StatefulWidget {
  @override
  State<onboard> createState() => _onboardState();
}

class _onboardState extends State<onboard> {
  int currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  _storeOnBoard() async {
    int isviewed = 0;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setInt("onboard", isviewed);
  }

  int i = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.pink.shade200,
                Colors.pink.shade100,
                Colors.pink.shade50
              ]),
        ),
        padding: EdgeInsets.all(20),
        child: PageView.builder(
            controller: _pageController,
            itemCount: screens.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },

            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(screens[index].json,
                      height: MediaQuery.of(context).size.height * 0.5),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    screens[index].context,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () async {
                            await _storeOnBoard();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                                color: Colors.blue.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                      space(Hi: 0, Wi: 20),
                      Container(
                        height: 10,
                        child: ListView.builder(
                            itemCount: screens.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Colors.pink.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      space(
                        Hi: 0,
                        Wi: 20,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (index == screens.length - 1) {
                              await _storeOnBoard();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                                color: Colors.blue.shade500,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
