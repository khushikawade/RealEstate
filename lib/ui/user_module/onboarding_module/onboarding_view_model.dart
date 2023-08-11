import 'package:flutter/material.dart';
import 'package:realstate/ui/user_module/onboarding_module/model/onboarding_model.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';

class OnBoardingViewModel extends ChangeNotifier {
  SplashScreenModel({
    required BuildContext context,
  }) {
    //initOnBoardingList();
  }
  PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  List<OnBoardingModel> _list = List.empty(growable: true);
  List<OnBoardingModel> get list => _list;
  set list(List<OnBoardingModel> list) {
    _list = list;
    print("List before notify ---------------- ${list.length}");
    notifyListeners();
  }

  int _currentSelectedIndex = 0;
  int get currentIndex => _currentSelectedIndex;
  set currentIndex(int value) {
    _currentSelectedIndex = value;
    notifyListeners();
  }
   // add items to onboarding list
  void initOnBoardingList() {
    print("Init called ------------------------------- ");
    list.add(OnBoardingModel(
        imagePath: Constants.onBoardingImage1,
        description:
            Constants.onBoardingDescription1,
        title: Constants.onBoardingTitle1));
    
    list.add(OnBoardingModel(
        imagePath: Constants.onBoardingImage2,
        description:
            Constants.onBoardingDescription2,
        title: Constants.onBoardingTitle2));

    list.add(OnBoardingModel(
        imagePath: Constants.onBoardingImage3,
        description:
            Constants.onBoardingDescription3,
        title: Constants.onBoardingTitle3));


    notifyListeners();
  }
  onNextPress(){
    Navigator.pushNamed(AppUtil.getContext(), '/login_screen');
  }

}
