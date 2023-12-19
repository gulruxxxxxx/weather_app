
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/weather_basics.dart';
import '../presentation/screens/weather_splash.dart';




abstract class AppRouts{
  static Route<dynamic> router(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/':
        return CupertinoPageRoute(builder: (_)=>const SplashScreen());

      case '/weather':
        return CupertinoPageRoute(builder: (_)=>const BasicScreen());

      default:
        return CupertinoPageRoute(builder: (_)=>const Scaffold());
    }
  }
}