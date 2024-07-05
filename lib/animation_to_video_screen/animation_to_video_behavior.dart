import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();
GlobalKey globalKeyOfWeddingCard = GlobalKey();
bool isInAnimationToVideo = false;
int namedCounterOfCard = 1;
int processedVideoCounter = 0;
String currentVideoTitle = '', currentGifTitle = '', currentImageTitle = '', currentlyProcessingFilePath = '';
List<String> animationToVideoCurrentStatusList = [];
List<Icon> tickMarkList = [];
AnimationProgressStatusChangeNotifier? animationProgressStatusChangeNotifier;
List<bool> animationToVideoProcessControlList = [];

// InterstitialAd? mInterstitialAd;

mixin class AnimationToVideoBehavior {

}

class AnimationProgressStatusChangeNotifier extends ChangeNotifier {
  String _progressStatus = '';
  String _status = 'stopped';
  int _progressPercentageValue = 0;
  bool _startTextButtonVisibility = true, _gifInvitation = false, _bannerAdNotify = false;

  get bannerAdNotify => _bannerAdNotify;

  set bannerAdNotify(value) {
    _bannerAdNotify = value;
    notifyListeners();
  }

  bool get startTextButtonVisibility => _startTextButtonVisibility;

  set startTextButtonVisibility(bool value) {
    _startTextButtonVisibility = value;
    notifyListeners();
  }

  int get progressPercentageValue => _progressPercentageValue;

  set progressPercentageValue(int value) {
    _progressPercentageValue = value;
    notifyListeners();
  }

  String get status => _status;

  set status(String value) {
    _status = value;
    notifyListeners();
  }

  String get progressStatus => _progressStatus;

  set progressStatus(String value) {
    _progressStatus = value;
    notifyListeners();
  }

  get gifInvitation => _gifInvitation;

  set gifInvitation(value) {
    _gifInvitation = value;
    notifyListeners();
  }
}

class CardToImage {
  Uint8List screenShotImage;

  CardToImage({required this.screenShotImage});
}
