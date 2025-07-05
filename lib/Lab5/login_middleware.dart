import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMiddleware extends GetMiddleware{

  RouteSettings? redirect(String? route){
    bool isLogin = true;

    if(!isLogin){
      return RouteSettings(name: "/loginScreen");
    }

    return RouteSettings(name: "/dataScreen");
  }


}