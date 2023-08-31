import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/list_main_tile.dart';
import 'package:realstate/helper_widget/sub_list_tile.dart';
import 'package:realstate/ui/home_module/home_screen/home_screen_model.dart';

import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

class homeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeScreenModel>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10.h,
          ),
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
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Column(
              children: [
                Main_list_tile(
                    Constants.buyProperty, RealState.buyproperty, model, 1),
                SizedBox(
                  height: 10.h,
                ),
                model.buyProperty == true
                    ? subListtile(model, Constants.buyProperty)
                    : Container(),
                model.buyProperty == true
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Container(),

                Main_list_tile(
                    Constants.saleProperty, RealState.saleproperty, model, 2),
                SizedBox(
                  height: 10.h,
                ),
                model.saleProperty == true
                    ? subListtile(model, Constants.saleProperty)
                    : Container(),
                model.saleProperty == true
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Container(),

                Main_list_tile(
                    Constants.giveOnRent, RealState.takeonrent, model, 3),
                SizedBox(
                  height: 10.h,
                ),
                model.giveOnRent == true
                    ? subListtile(model, Constants.giveOnRent)
                    : Container(),
                model.giveOnRent == true
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Container(),

                Main_list_tile(
                    Constants.takeOnRent, RealState.takeonrent, model, 4),
                SizedBox(
                  height: 10.h,
                ),
                model.takeOnRent == true
                    ? subListtile(model, Constants.takeOnRent)
                    : Container(),
                model.takeOnRent == true
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Container(),

                Main_list_tile(Constants.support, RealState.support, model, 5),
                SizedBox(
                  height: 10.h,
                ),
                model.support == true
                    ? subListtile(model, Constants.support)
                    : Container(),
                model.support == true
                    ? SizedBox(
                        height: 10.h,
                      )
                    : Container(),

                Main_list_tile(Constants.previousPost,
                    RealState.previouspost, model, 6),
                SizedBox(
                  height: 10.h,
                ),
                // model.previousPost == true ? subListtile(model, Constants.previousPost) : Container(),
                // model.previousPost == true ? SizedBox(height: 10.h, ) : Container(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
