import 'package:flutter/material.dart';
import 'package:realstate/utils/app_util.dart';

class registrationModel extends ChangeNotifier {
  registrationModel({
    required BuildContext context,
  }) {}
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController nameField = TextEditingController();
  TextEditingController eameField = TextEditingController();
  TextEditingController dateField= TextEditingController();
  
  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }
  registrationButtonPressed()
{
  
}}
