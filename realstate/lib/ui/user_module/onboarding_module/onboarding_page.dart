import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
        color: AppColors.white,
        child: Stack(
            // alignment: Alignment.center,
            children: [
              ImageViewWidget(model),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextViewWidget(model),
                    SizedBox(
                      height: 10.h,
                    ),
                    dotsIndicatorWidget(model),
                  ]),
            ]));
  }

  // Widget onBoardingView(OnBoardingViewModel model) {
  //   return Container(
  //     width: double.infinity,
  //     height: double.infinity,
  //     color: AppColors.white,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.max,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         pageViewWidget(model),
  //         SizedBox(
  //           height: 20.h,
  //         ),
  //         dotsIndicatorWidget(model),
  //         SizedBox(
  //           height: 20.h,
  //         ),

  //       ],
  //     ),
  //   );
  // }

  // Make widget that will handle dots index when page changes
  Widget dotsIndicatorWidget(OnBoardingViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
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
            : AppColors.white.withOpacity(0.4))
      ],
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

  Widget ImageViewWidget(OnBoardingViewModel model) {
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
          return ImageViewItemWidget(model, index);
        });
  }

  // Make widget for page view item
  Widget ImageViewItemWidget(OnBoardingViewModel model, index) {
    return fullScreenImage(model.list[index].imagePath!);
  }

  // Make widget that will return page view content in list view type
  Widget TextViewWidget(OnBoardingViewModel model) {
    return Expanded(
      child: PageView.builder(
          itemCount: model.list.length,
          controller: model.pageController,
          physics: BouncingScrollPhysics(),
          onPageChanged: (value) {
            model.currentIndex = value;
          },
          allowImplicitScrolling: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TextViewItemWidget(model, index);
          }),
    );
  }

  // Make widget for page view item
  Widget TextViewItemWidget(OnBoardingViewModel model, index) {
    return Column(
      children: [
        OnboardingHeadingWidget(model.list[index].title, context),
        OnboardingSubtitleWidget(model.list[index].description, context),
      ],
    );
  }
}
