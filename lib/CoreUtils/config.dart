import 'package:flutter/cupertino.dart';

const String appServerBaseAddress ="http://192.168.1.101/mobileAppBackend/";




enum AppStatus{
  init,
  logged,
}

var status = AppStatus.init;

void check(status){

  switch (status){

    case AppStatus.init:
      debugPrint("init");
      break;
    case AppStatus.logged:
      debugPrint("logged");
      break;

    default:
      debugPrint("default");
      break;
  }

}

