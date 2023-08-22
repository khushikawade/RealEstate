import 'package:flutter/material.dart';
import 'package:realstate/ui/home_module/Home_model/home_screen_model.dart';
import 'package:realstate/utils/constant.dart';

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

  buyPlotResidential(int Heading, int subheading, int value) {
    switch (Heading) {
      case 1:
        switch (subheading) {
          case 1:
            switch (value) {
              case 1:
                print("//--------buy property-plot-Residential-------//");
              case 2:
              print("//--------buy property-plot-Commercial-------//");
              default:
                null;
            }

          case 2:
            switch (value) {
              case 1:
                print("//--------buy property-land-Residential-------//");
              case 2:
              print("//--------buy property-land-Commercial-------//");
              default:
                null;
            }
          case 3:
            switch (value) {
              case 1:
                print("//--------buy property-Commercial Constructed-Residential-------//");
              case 2:
              print("//--------buy property-Commercial Constructed-Commercial-------//");
              default:
                null;
            }
          case 4:
            switch (value) {
              case 1:
                print("//--------buy property-Residential Constructed-Residential-------//");
              case 2:
              print("//--------buy property-Residential Constructed-Commercial-------//");
              default:
                null;
            }
          default:
            null;
        }

      case 2:
        switch (subheading) {
          case 1:
            switch (value) {
             case 1:
                print("//--------sale property-plot-Residential-------//");
              case 2:
              print("//--------sale property-plot-Commercial-------//");
              default:
                null;
            }
          case 2:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }
          case 3:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }
          case 4:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }
          default:
            null;
        }
      case 3:
        switch (subheading) {
          case 1:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }

          case 2:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }
          case 3:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }
          case 4:
            switch (value) {
              case 1:
              case 2:
              default:
                null;
            }
          default:
            null;
        }
      case 4:
      case 5:
      case 6:
      default:
        null;
    }
  }
}
