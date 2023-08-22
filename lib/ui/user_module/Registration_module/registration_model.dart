// import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/validator.dart';

class registrationModel extends ChangeNotifier {
  registrationModel({
    required BuildContext context,
  }) {}
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController dateField = TextEditingController();

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  bool _onTap = false;
  bool get onTap => _onTap;
  set onTap(bool value) {
    _onTap = value;
    notifyListeners();
  }

  bool _onSignUpButtonTap = false;
  bool get onSignUpButtonTap => _onSignUpButtonTap;
  set onSignUpButtonTap(bool value) {
    _onSignUpButtonTap = value;
    notifyListeners();
  }

  registrationButtonPressed() {
    onSignUpButtonTap = true;
    if (globalKey.currentState!.validate() &&
        onTap &&
        Validator.emailValidateNew(emailField.text) == null) {
      // callRegisterApi();
      Navigator.popAndPushNamed(AppUtil.getContext(), '/home_screen');
    }
  }

  OntapFunction(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(
            1950), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2020));

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);
      dateField.text = formattedDate;
      notifyListeners();
    } else {
      print("Date is not selected");
    }
  }

  void redirectToTermPage() {
    print("terms taped.");
  }

  void redirectToPolicyPage() {
    print("Privecy policy Taped.");
  }
}
