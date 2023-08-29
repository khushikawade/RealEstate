// import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:realstate/utils/constant.dart';
// import 'package:gestures/gestures.dart';
// import 'app_util.dart';

class Validator {
// bool? Function(String?)? usernameValidator = (String? username) {
  static bool emailValidation(String value) {
    final validEmail =
        RegExp(r'\S+@\S+\.\S+'); //RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
    return validEmail.hasMatch(value);
  }

//password validator possible structure
  static String? passwordValidator(dynamic password) {
    // String? Function(String?)? passwordValidator = (String? password) {
    if (password!.isEmpty) {
      // Fluttertoast.showToast(msg: "Password can't be empty");
      return Constants.fieldCanNotBeEmpty;
    } else if (password.length < 6) {
      // Fluttertoast.showToast(msg: "Please enter valid password");
      return Constants.mustBe8Char;
    }
    return null;
  }

  // String? Function(String?)?
  static bool emailValidator(String? email) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (email!.isEmpty) {
      Fluttertoast.showToast(msg: Constants.invalidEmail);

      return false;
    } else if (!regex.hasMatch(email)) {
      Fluttertoast.showToast(msg: Constants.invalidEmail);
      return false;
    } else
      return true;
  }

  static String? emailValidate(dynamic value) {
    if (value.isNotEmpty) {
      if (Validator.emailValidation(value.trim())) {
        return null;
      } else {
        return Constants.invalidEmail;
      }
    } else {
      return Constants.fieldCanNotBeEmpty;
    }
  }

  static String? fullNameValidate(String fullName) {
    String patttern = '[a-zA-Z]';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return Constants.fieldCanNotBeEmpty;
    } else if (!regExp.hasMatch(fullName)) {
      return null;
    }
    return Constants.pleaseEnterName;
  }

  static String? validMobile(String value) {
    // final mobileRegExp = RegExp(r'^[6-9][0-9]{9}$');
    final mobileRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    // if (value.isNotEmpty && mobileRegExp.hasMatch(value)) {
    //   return null;
    // }
    if (!mobileRegExp.hasMatch(value)) {
      return Constants.enterMobileNumber;
    } else if (value.isEmpty) {
      //AppUtil.showToast(Constants.enterMobileNumber);
      return Constants.fieldCanNotBeEmpty;
    } else if (value.length < 10) {
      return Constants.mustBe10Char;
    } else {
      return null;
    }
  }

  static String? fieldCheckboxEmpty(String value) {
    // Text('Field can not be emptyoooo');
    String message = Constants.fieldCanNotBeEmpty;
    //  String message =  Text('Field can not be emptyoooo',
    //       style:
    //           const TextStyle(fontSize: 50, backgroundColor: Color(0xff858D93)));
    if (value.isNotEmpty) {
      return null;
    } else {
      return message;
    }
  }

  static String? nameValidate(String value) {
    print(value);
    if (value.length > 4) {
      return null;
    } else {
      return Constants.pleaseEnterName;
    }
  }

  static String? fieldNameValidate(String value) {
    if (  value.length < 2) {
      return Constants.pleaseEnterName;
    }
    return null;
  }

  static String? fieldEmpty(String? value) {
    if (value != null || value!.isNotEmpty ) {
      return null;
    } else {
      return Constants.fieldCanNotBeEmpty;
    }
  }

  static String? emailValidateNew(String? value) {
    final RegExp validEmail = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');

    if (value!.isNotEmpty && validEmail.hasMatch(value)) {
      return null;
    }
    if (value == null ||value.isEmpty) {
      return Constants.enterEmail;
    } else {
      return Constants.invalidEmail;
    }
  }
}
