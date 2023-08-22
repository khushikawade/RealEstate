import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fullScreenImage(String ImageUrl) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(ImageUrl,
        width: double.infinity, height: double.infinity, fit: BoxFit.cover),
  );
}
Widget appBarImage(String ImageUrl) {
  return Container(
    width: double.infinity,
    height: 100.h,
    child: Image.asset(ImageUrl,
        width: double.infinity, height: 100.h, fit: BoxFit.cover),
  );
}
Widget headingImage(String ImageUrl,) {
  return Center(
    child: Image.asset(ImageUrl,
        width: 114.h, height: 114.h, fit: BoxFit.cover),
  );
}
Widget successImage(String ImageUrl,) {
  return Center(
    child: Image.asset(ImageUrl,
        width: 148.h, height: 148.h, fit: BoxFit.cover),
  );
}
