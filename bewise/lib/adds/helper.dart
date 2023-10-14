import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admobservice {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) {
      debugPrint('ad Loader');
      print('loaded!!!!!!!!!!');
    },
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('ad failed to load');
    },
    onAdOpened: (ad) => debugPrint('ad opened'),
    onAdClosed: (ad) => debugPrint('ad closed'),
  );
}
