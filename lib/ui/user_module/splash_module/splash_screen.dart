import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/progress_Indicator.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/ui/user_module/splash_module/splash_view_model.dart';
import 'package:realstate/utils/constant.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final splashViewModel =
          Provider.of<SplashScreenModel>(context, listen: false);

      splashViewModel.startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<SplashScreenModel>(context);
    return Scaffold(
      body: splashView(),
    );
  }

  Widget splashView() {
    return Stack(
      alignment: Alignment.center,
      children:[
        fullScreenImage(Constants.splashImage),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            SizedBox(
              height: 150.h,
            ),
            headlineTextWidget(Constants.splashTitle,
            context), 
            SizedBox(
              height: 15.h,
            ),
             buildProgressIndicator(),
            
          ] 
        )

      ]
    );
  }
}
