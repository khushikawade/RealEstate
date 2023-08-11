import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/utils/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children:[
            SizedBox(
              height: 60.h,
            ),
            headingTextWidget(Constants.loginHeading,context),
            SizedBox(
              height: 20.h,
            ),
            subheadingTextWidget(Constants.loginSubheading,context),
            SizedBox(
              height: 20.h,
            ),
            headingImage(Constants.loginImage),
            SizedBox(
              height: 20.h,
            ),

          ]
        )

      )
    );
  }
}
