import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/ui/home_module/SuccessModule/successModel.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SuccessScreenModel>(context);
    return Scaffold(
      body: successScreeView(model),
    );
  }

  Widget successScreeView(SuccessScreenModel model) {
    return Stack(alignment: Alignment.center, children: [
     
      Center(
        child: Padding(
          padding: EdgeInsets.only(left: 20.h, right: 20.h),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                waitlistImage(Constants.successImage),
                SizedBox(
                  height: 20.h,
                ),
                headingTextWidget(Constants.succesHeading, context),
                SizedBox(
                  height: 10.h,
                ),
                Text(Constants.succesSubheading,
                textAlign: TextAlign.center,
                    style: AppTheme.lightTheme.textTheme.titleSmall!
                        .copyWith(fontSize: 18.h)),
                SizedBox(
                  height: 10.h,
                ),
              
                Text(Constants.succesConstant,
                textAlign: TextAlign.center,
                    style: AppTheme.lightTheme.textTheme.displaySmall),
                
              ]),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom:20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formLabelWidget(Constants.share, context),
            SizedBox(
              height: 10.h,
            ),
            successImage(Constants.shareImage),
           
          ],
        ),
      )
    ]);
    ;
  }
}
