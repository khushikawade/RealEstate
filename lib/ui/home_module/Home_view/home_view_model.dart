import 'package:flutter/material.dart';
import 'package:realstate/ui/home_module/profile_module/profile_screen.dart';
import 'package:realstate/ui/home_module/home_screen/home_screen.dart';

class HomeViewModel extends ChangeNotifier {

  HomeViewModel({required BuildContext context}) {}
   int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
  final List<Widget> children = [
    homeView(),
    ProfileView(),
  ];
  void onTabTapped(int index) {
      currentIndex = index;
  }
  
}