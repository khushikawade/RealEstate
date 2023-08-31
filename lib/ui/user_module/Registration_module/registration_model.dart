
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:realstate/services/api.dart';
import 'package:realstate/services/models/register_user_resp_model.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/validator.dart';

class registrationModel extends ChangeNotifier {
  registrationModel({
    required BuildContext context,
  }) {}
   final Api _api = Api();
  GlobalKey<FormState> registrationglobalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController dateField = TextEditingController();
  final ImagePicker picker = ImagePicker();

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

  var _mobile;
  get mobile => _mobile;
  set mobile(var value) {
    _mobile = value;
    notifyListeners();
  }
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _imageurl = '';
  String get imageurl => _imageurl;
  set imageurl(String value) {
    _imageurl = value;
    notifyListeners();
  }

XFile? url;

  registrationButtonPressed() {
    onSignUpButtonTap = true;
    if (registrationglobalKey.currentState!.validate() &&
        onTap &&
        Validator.emailValidateNew(emailField.text) == null) {
     callRegisterApi();
      // Navigator.pushNamed(AppUtil.getContext(), '/home_screen');
    }
  }

  callRegisterApi() async {
    // showLoader = true;
    var map = Map<String, dynamic>();
    map['email'] = emailField.text.toString();
    map['full_name'] = nameController.text.toString();
    map['mobile'] = mobile.toString();
    map['date_of_birth'] = dateField.text.toString();
    // map['image'] = mobileController.text.toString();

    RegisterUserResp registerResp = await _api.registerApi(map);

    navigateToScreen() {
      print("CLICK MODE FUNCTION");

      if (registerResp.data != null && registerResp.data != '') {
         Navigator.pushNamed(AppUtil.getContext(), '/home_screen');
      }
    }

    

    switch (registerResp.status) {
      case Constants.sucessCode:
        if (registerResp.message != null && registerResp.message!.isNotEmpty) {
          showLoader = false;
          navigateToScreen();
        }

        break;
      case Constants.wrongError:
        AppUtil.showDialogbox(AppUtil.getContext(),
            registerResp.error ?? 'Oops Something went wrong');

        break;

      case Constants.networkErroCode:
        AppUtil.showDialogbox(AppUtil.getContext(),
            registerResp.error ?? 'Oops Something went wrong');

        break;
      default:
        {
          if (registerResp.error != null && registerResp.error!.isNotEmpty) {
            AppUtil.showDialogbox(AppUtil.getContext(),
                registerResp.error ?? 'Oops Something went wrong');
          }
        }
        break;
    }
    showLoader = false;
  }



  OntapFunction(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(
            1950), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2020));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
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
