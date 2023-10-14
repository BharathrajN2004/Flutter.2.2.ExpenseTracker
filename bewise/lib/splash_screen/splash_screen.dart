// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import '/minorComponents/sizedBox.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../Home.dart';
// import 'package:page_transition/page_transition.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        splashIconSize: MediaQuery.of(context).size.height,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/splashlogo.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'from',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/softrate bg.jpg',
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                    Text(
                      'SOFTRATE',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    space(Hi: 5, Wi: 0),
                  ],
                ),
              ],
            )
          ],
        ),
        pageTransitionType: PageTransitionType.fade,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(seconds: 1),
        duration: 2000,
        backgroundColor: Colors.grey.shade50,
        nextScreen: Home(),
      ),
    );
  }
}
