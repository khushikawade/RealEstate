import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/helper_widget/waitlistRow.dart';
import 'package:realstate/ui/waitlist/waitlist_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';

class WaitListScreen extends StatefulWidget {
  @override
  _WaitListScreenState createState() => _WaitListScreenState();
}

class _WaitListScreenState extends State<WaitListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = Provider.of<WaitListScreenModel>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WaitListScreenModel>(context);
    return Scaffold(
      body: waitListView(model),
    );
  }

  Widget waitListView(WaitListScreenModel model) {
    return SingleChildScrollView(
        child: Column(
          children: [
      SizedBox(
        height: 60.h,
      ),
      successImage(Constants.verifyImage),
      SizedBox(
        height: 20.h,
      ),
      headingTextWidget("Thank you Michelle ", context),
      SizedBox(
        height: 20.h,
      ),
       
       Text("Your request was submitted 12/07/2023 and is currently waiting to be approved.If approved, a notification will be sent to your email or Number.",
      style: AppTheme.lightTheme.textTheme.displaySmall) ,
      SizedBox(
        height: 20.h,
      ),
      
      waitListRow(model),
    ]));
  }

  Widget waitListRow(WaitListScreenModel model) {
    return Column(
      children: [
        waitListSingleRow(context, Constants.pending, Constants.days,
            RealState.done, AppColors.primaryColor),
        waitListDivider(
          AppColors.yellow,
        ),
        waitListSingleRow(context, Constants.joinedWaitlist, Constants.days,
            RealState.done, AppColors.primaryColor),
        waitListDivider(
          AppColors.green,
        ),
        waitListSingleRow(
          context,
          Constants.pendingforApproval,
          Constants.days,
          RealState.pending,
          AppColors.yellow,
        ),
      ],
    );
  }
}
