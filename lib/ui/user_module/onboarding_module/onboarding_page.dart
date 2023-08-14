import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/ui/user_module/onboarding_module/onboarding_view_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/constant.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = Provider.of<OnBoardingViewModel>(context, listen: false);
      model.initOnBoardingList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<OnBoardingViewModel>(context);
    return Scaffold(body: onBoardingView(model));
  }

  // Make widget for splash screen
  Widget onBoardingView(OnBoardingViewModel model) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          PageViewWidget(model),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dotsIndicatorWidget(model),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Make widget that will return page view content in list view type
  Widget PageViewWidget(OnBoardingViewModel model) {
    return PageView.builder(
        itemCount: model.list.length,
        controller: model.pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (value) {
          model.currentIndex = value;
        },
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PageViewItemWidget(model, index);
        });
  }

  // Make widget for page view item
  Widget PageViewItemWidget(OnBoardingViewModel model, index) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            fullScreenImage(model.list[index].imagePath!),
            Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  onboardingHeadingWidget(model.list[index].title, context),
                  SizedBox(
                    height: 10.h,
                  ),
                  onboardingSubtitleWidget(
                      model.list[index].description, context),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  // Make widget that will handle dots index when page changes
  Widget dotsIndicatorWidget(OnBoardingViewModel model) {
    return Container(
      height: 40,
      width: double.infinity,
      // padding: EdgeInsets.only(left: 140.h, top: 30.h, bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(child: Container()),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dotWidget(model.currentIndex == 0
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.4)),
                SizedBox(
                  width: 8.w,
                ),
                dotWidget(model.currentIndex == 1
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.4)),
                SizedBox(
                  width: 8.w,
                ),
                dotWidget(model.currentIndex == 2
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.4)),
              ],
            ),
          ),
          model.currentIndex == 2
              ? Expanded(
                  child: Container(
                    child: InkWell(
                        onTap: () {
                          model.onNextPress();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            onboardingLabelWidget(Constants.next, context),
                            SizedBox(
                              width: 8.w,
                            ),
                            Icon(
                              //  Icons.arrow_forward_outlined,
                                RealState.next,
                              size: 17.h,
                              color: AppColors.white,
                            ),
                            SizedBox(
                                  width: 20.w,
                                )
                          ],
                        )),
                  ),
                )
              : Expanded(child: Container())
        ],
      ),
    );
  }

  // Make dot widget circle
  Widget dotWidget(color) {
    return Container(
      width: 6.w,
      height: 6.w,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
