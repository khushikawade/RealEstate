import 'package:flutter/material.dart';
import 'package:realstate/utils/app_util.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    required BuildContext context,
  }) {}
  TextEditingController mobileNoControllers = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }
  bool _onLoginButtonTap = false;
  bool get onLoginButtonTap => _onLoginButtonTap;
  set onLoginButtonTap(bool value) {
    _onLoginButtonTap = value;
    notifyListeners();
  }

  loginButtonPressed(){
    onLoginButtonTap = true;
    if (globalKey.currentState!.validate()) {
      // callgetOtpApi();
      Navigator.pushNamed(
            AppUtil.getContext(), '/verify_mobile_number_screen',
            // arguments: user
            );

    }

  }
  TextChangeFunction(){

  }

}
