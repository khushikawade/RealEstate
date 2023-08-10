import 'package:flutter/material.dart';

Widget fullScreenImage(String ImageUrl) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.asset(ImageUrl,
        width: double.infinity, height: double.infinity, fit: BoxFit.cover),
  );
}
