import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/utils/app_colors.dart';

BottomBarWidget( model, BuildContext context) {
  return BottomNavigationBar(
    selectedItemColor: AppColors.white, 
    unselectedItemColor: AppColors.lightGrey,
    backgroundColor:AppColors.bottomBar ,
    onTap: model.onTabTapped,
    currentIndex: model.currentIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home,
        size: 24.h,
        ),
         
         label: '',
      ),
     
      BottomNavigationBarItem(
        icon: Icon(Icons.person,
        size: 24.h,
        ),
       label: '',
      ),
      
    ],
  );
 
}
