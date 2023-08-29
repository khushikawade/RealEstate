import 'package:flutter/material.dart';
import 'package:realstate/ui/home_module/formView/formView.dart';
import 'package:realstate/utils/app_util.dart';

class HomeScreenModel extends ChangeNotifier {
  HomeScreenModel({required BuildContext context}) {}

  bool _buyProperty = false;
  bool get buyProperty => _buyProperty;
  set buyProperty(bool value) {
    _buyProperty = value;
    notifyListeners();
  }

  bool _saleProperty = false;
  bool get saleProperty => _saleProperty;
  set saleProperty(bool value) {
    _saleProperty = value;
    notifyListeners();
  }

  bool _giveOnRent = false;
  bool get giveOnRent => _giveOnRent;
  set giveOnRent(bool value) {
    _giveOnRent = value;
    notifyListeners();
  }

  bool _takeOnRent = false;
  bool get takeOnRent => _takeOnRent;
  set takeOnRent(bool value) {
    _takeOnRent = value;
    notifyListeners();
  }

  bool _support = false;
  bool get support => _support;
  set support(bool value) {
    _support = value;
    notifyListeners();
  }

  bool _previousPost = false;
  bool get previousPost => _previousPost;
  set previousPost(bool value) {
    _previousPost = value;
    notifyListeners();
  }

  bool _plot = false;
  bool get plot => _plot;
  set plot(bool value) {
    _plot = value;
    notifyListeners();
  }

  bool _land = false;
  bool get land => _land;
  set land(bool value) {
    _land = value;
    notifyListeners();
  }

  bool _commercialConstructed = false;
  bool get commercialConstructed => _commercialConstructed;
  set commercialConstructed(bool value) {
    _commercialConstructed = value;
    notifyListeners();
  }

  bool _residentialConstructed = false;
  bool get residentialConstructed => _residentialConstructed;
  set residentialConstructed(bool value) {
    _residentialConstructed = value;
    notifyListeners();
  }

  previousPostOntap() {
    print("hello");
    Navigator.pushNamed(AppUtil.getContext(), '/previouspost_screen');
  }

  finalListTileItemontap(String heading, String subheading, String value) {
    // print("//--------$Heading-------//");
    // print("//--------$subheading-------//");
    // print("//--------$value-------//");
    // Navigator.of(
    //         AppUtil.navigationKey.currentState!.context,
    //       ).push(MaterialPageRoute(builder: (BuildContext context) {
    //         return FormView(
    //           heading: heading,
    //           subHeading: subheading,
    //           title: value,
    //         );
    //       }));

    FormView.showFormbox(AppUtil.getContext(), heading, subheading, value);
  }
}
