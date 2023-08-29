import 'package:flutter/material.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';

class FormViewModel extends ChangeNotifier {
  FormViewModel({required BuildContext context}) {}
  GlobalKey<FormState> formViewGlobalKey = GlobalKey<FormState>();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController front = TextEditingController();
  TextEditingController firstDimension = TextEditingController();
  TextEditingController secondDimension = TextEditingController();
  TextEditingController carpetArea = TextEditingController();
  TextEditingController plotArea = TextEditingController();
  TextEditingController features = TextEditingController();
  TextEditingController comment = TextEditingController();

  String _heading = '';
  String get heading => _heading;
  set heading(String value) {
    _heading = value;
    notifyListeners();
  }

  String _title = '';
  String get title => _title;
  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String _subHeading = '';
  String get subHeading => _subHeading;
  set subHeading(String value) {
    _subHeading = value;
    notifyListeners();
  }

  bool _showLoader = false;
  bool get showLoader => _showLoader;
  set showLoader(bool value) {
    _showLoader = value;
    notifyListeners();
  }

  int _checkedIndex = 0;
  int get checkedIndex => _checkedIndex;
  set checkedIndex(int value) {
    _checkedIndex = value;
    notifyListeners();
  }

  String _facing = '';
  String get facing => _facing;
  set facing(String value) {
    _facing = value;
    notifyListeners();
  }

  bool _onFormButtonTap = false;
  bool get onFormButtonTap => _onFormButtonTap;
  set onFormButtonTap(bool value) {
    _onFormButtonTap = value;
    notifyListeners();
  }

  formButtonPressed() {
    onFormButtonTap = true;
    if (checkedIndex == 0) {
      checkedIndex = 5;
    }
    if (formViewGlobalKey.currentState!.validate() &&
        checkedIndex != 0 &&
        checkedIndex != 5) {
      // callRegisterApi();
      closePopuponSuccess();
    }
  }

  onSuccessRedirect() {
    Navigator.pushNamed(AppUtil.getContext(), '/success_screen');
  }

  closePopuponSuccess() {
     _resetFormValue();
    Navigator.pop(AppUtil.getContext(), true);
  }

  closePopuponcross() {
    _resetFormValue();
    Navigator.pop(AppUtil.getContext(), false);
  }

  void _resetFormValue() {
    checkedIndex = 0;
    facing = '';
    state.clear();
    city.clear();
    locality.clear();
    size.clear();
    firstDimension.clear();
    secondDimension.clear();
    carpetArea.clear();
    plotArea.clear();
   front.clear();
    features.clear();
    comment.clear();
  }

  checkBoxTapped(int checked) {
    checkedIndex = checked;
    switch (checked) {
      case 1:
        facing = Constants.north;
      case 2:
        facing = Constants.east;
      case 3:
        facing = Constants.south;
      case 4:
        facing = Constants.west;
      default:
        null;
    }

    print("checkboxTapped $checked");
  }
}
