import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/ListMaintile.dart';
import 'package:realstate/helper_widget/app_bar.dart';
import 'package:realstate/helper_widget/bottomBar.dart';
import 'package:realstate/helper_widget/sub_listTile.dart';
import 'package:realstate/ui/home_module/Home_model/home_screen_model.dart';

import 'package:realstate/ui/home_module/home_screen_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final HomeViewModel =
          Provider.of<HomeScreenModel>(context, listen: false);

      // splashViewModel.startTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeScreenModel>(context);
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: AppBarWidget(),
          ),
           bottomNavigationBar:BottomBarWidget(),
          body: homeView(model, context)),
    );
  }

  homeView(HomeScreenModel model, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.homeHeading,
                  textAlign: TextAlign.left,
                  style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
                    fontSize: 16.h,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Main_list_tile(Constants.buyProperty, Icons.call, model, 1),
                SizedBox(
                  height: 10.h,
                ),
                model.buyProperty == true
                    ? subListtile(model,1)
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                Main_list_tile(Constants.saleProperty, Icons.call, model, 2),
                SizedBox(
                  height: 10.h,
                ),
                model.saleProperty == true
                    ? subListtile(model,2)
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                Main_list_tile(Constants.giveOnRent, Icons.call, model, 3),
                SizedBox(
                  height: 10.h,
                ),
                model.giveOnRent == true
                    ? subListtile(model,3)
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                Main_list_tile(Constants.takeOnRent, Icons.call, model, 4),
                SizedBox(
                  height: 10.h,
                ),
                model.takeOnRent == true
                    ? subListtile(model,4)
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                Main_list_tile(Constants.support, Icons.call, model, 5),
                SizedBox(
                  height: 10.h,
                ),
                model.support == true
                    ? subListtile(model,5)
                    : Container(),
                SizedBox(
                  height: 8.h,
                ),
                Main_list_tile(Constants.previousPost, Icons.call, model, 6),
                SizedBox(
                  height: 10.h,
                ),
                model.previousPost == true
                    ? subListtile(model,6)
                    : Container(),

                // Sub_list_tile(),

                // _buildFilter(HomeScreenModel, context, true)
              ]
        ),
      ),
    );
  }

}
