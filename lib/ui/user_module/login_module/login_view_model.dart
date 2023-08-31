import 'package:flutter/material.dart';
import 'package:realstate/services/api.dart';
import 'package:realstate/services/models/get_otp_resp_model.dart';
import 'package:realstate/services/models/user_model.dart';
// import 'package:realstate/services/models/user_model.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({
    required BuildContext context,
  }) {}
  final Api _api = Api();
  TextEditingController mobileNoControllers = TextEditingController();
  GlobalKey<FormState> loginGlobalKey = GlobalKey<FormState>();

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

  loginButtonPressed() {
    onLoginButtonTap = true;
    if (loginGlobalKey.currentState!.validate()) {
      callgetOtpApi();
      // Navigator.pushNamed(
      //   AppUtil.getContext(), '/Verification_screen',
      //   // arguments: user
      // );
    }
  }

  Future<void> callgetOtpApi() async {
    showLoader = true;
    var map = Map<String, dynamic>();
    map['mobile'] = mobileNoControllers.text;

    GetOtpResp getOtpResp = await _api.getOtpApi(map);
    print("response: $getOtpResp.data");

    navigateToScreen() {
      print("CLICK MODE FUNCTION");

      if (getOtpResp.data != null && getOtpResp.data != '') {
        User user =
            User(mobile: mobileNoControllers.text, otp: getOtpResp.data!.otp);

        Navigator.pushNamed(AppUtil.getContext(), '/Verification_screen',
            arguments: user);
      
      }
    }

    switch (getOtpResp.status) {
      case Constants.sucessCode:
        if (getOtpResp.message != null && getOtpResp.message!.isNotEmpty) {
          showLoader = false;
          navigateToScreen();
        }

        break;
      case Constants.wrongError:
        AppUtil.showDialogbox(AppUtil.getContext(),
            getOtpResp.error ?? 'Oops Something went wrong');

        break;

      case Constants.networkErroCode:
        AppUtil.showDialogbox(AppUtil.getContext(),
            getOtpResp.error ?? 'Oops Something went wrong');

        break;
      default:
        {
          if (getOtpResp.error != null && getOtpResp.error!.isNotEmpty) {
            AppUtil.showDialogbox(AppUtil.getContext(),
                getOtpResp.error ?? 'Oops Something went wrong');
          }
        }
        break;
    }

    showLoader = false;
  }

  TextChangeFunction() {}
}
