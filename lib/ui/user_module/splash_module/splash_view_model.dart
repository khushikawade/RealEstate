import 'dart:async';
import 'package:flutter/material.dart';
import 'package:realstate/utils/app_util.dart';

class SplashScreenModel extends ChangeNotifier {
  SplashScreenModel({ required BuildContext context}){}
  void startTimer(){
   Timer(const Duration(seconds: 3), () {
      checkAutoLogin();
    }); 
  }
 // check auto login in the app
  checkAutoLogin() async {
      Navigator.popAndPushNamed(AppUtil.getContext(), '/onboarding_section');
  }
}
