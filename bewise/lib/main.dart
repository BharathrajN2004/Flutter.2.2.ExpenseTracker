// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, import_of_legacy_library_into_null_safe, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/data/tdata.dart';
import '/color/colors.dart';
import '/onboarding/on_boarding.dart';
import '/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/history.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

int? isviewed;

void main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  MobileAds.instance.initialize();
  //
  await Hive.initFlutter();
  //
  Hive.registerAdapter(tdataAdapter());
  //
  Hive.registerAdapter(historyAdapter());
  //
  await Hive.openBox<tdata>('tdatadb');
  //
  await Hive.openBox<history>('histdb');
  //
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  //
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onboard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bewise',
      theme: ThemeData(
        fontFamily: 'ElMessiri',
      ),
      debugShowCheckedModeBanner: false,
      home: isviewed != 0 ? onboard() : splash(),
    );
  }
}
