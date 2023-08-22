import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';


Widget tabBarViewForAgent(
    {required Completer<bool> completer,
    required BuildContext context,
    required singupUploadPhotoViewModelForAgent,
    bool? typeOfTab}) {
  final ValueNotifier<int> selectedTabIndex = ValueNotifier<int>(0);
  return Container(
    height: 400.h,
    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
    child: DefaultTabController(
      initialIndex: selectedTabIndex.value,
      length: 2,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {
              selectedTabIndex.value = value;
            },
            indicatorSize: TabBarIndicatorSize.tab, // sets indicatorSize to tab
            // labelColor: Palette.backIconColor,
            indicator: ShapeDecoration(
              shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.black,
                      width: 3.0,
                      style: BorderStyle.solid)),
              // gradient: LinearGradient(colors: [
              //   Palette.linearIndicatorbg_1,
              //   Palette.linearIndicatorbg_2,
              //   Palette.linearIndicatorbg_3
              // ]),
            ),
            indicatorWeight: 0.5,

            // indicatorPadding: const EdgeInsets.all(0.0),
            // indicatorWeight: 4.0,
            labelPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
            automaticIndicatorColorAdjustment: false,
            indicatorPadding:
                EdgeInsets.only(top: 38.h, left: 12.w, right: 12.w),
            tabs: <Widget>[
              ValueListenableBuilder(
                valueListenable: selectedTabIndex,
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 00.sp),
                    child: SvgPicture.asset(
                      'assets/svg/tab_bar_profile.svg',
                      color: selectedTabIndex.value == 0
                          ? AppColors.black
                          : AppColors.greyLight,
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: selectedTabIndex,
                builder: (context, value, child) {
                  return selectedTabIndex.value == 1
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 3.sp),
                          child: Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.black)),
                            child: Padding(
                              padding: EdgeInsets.all(6.sp),
                                  // Globals.deviceType == 'phone' ? 4.sp : 6.sp), commented
                              child: SvgPicture.asset(
                                'assets/Skip1.jpg',
                                alignment: Alignment.center,
                                height: 35.h,
                                width: 35.w,
                              ),
                            ),
                          ),
                        )
                      : SvgPicture.asset(
                          'assets/Skip1.jpg',
                          height: 40.h,
                          width: 40.w,
                        );
                },
              )
            ],
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.27.h,
              child: TabBarView(children: <Widget>[
                Tab(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                            height:16.h
                          ),
                      // VerticalSpacerWidget(16.h),
                      ListTile(
                          leading: SvgPicture.asset(
                            'assets/Skip1.jpg',
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.fill,
                          ), //_buildIcon(Icons.camera_alt),
                          title: Text("Upload from your library",
                              style: AppTheme.lightTheme.textTheme.labelSmall),
                          selected: true,
                          onTap: () {
                            imgFromGallery(singupUploadPhotoViewModelForAgent,
                                context, completer);
                          }),
                          SizedBox(
                            height:8.h
                          ),
                      // VerticalSpacerWidget(8.h),
                      ListTile(
                          leading: SvgPicture.asset(
                            'assets/Skip1.jpg',
                            height: 30.h,
                            width: 30.w,
                            fit: BoxFit.fill,
                          ),
                          title: Text("Take a photo",
                              style: AppTheme.lightTheme.textTheme.labelSmall),
                          selected: true,
                          onTap: () {
                            openCamera(singupUploadPhotoViewModelForAgent,
                                context, completer);
                          }),
                          SizedBox(
                            height:8.h
                          ),
                      // VerticalSpacerWidget(8.h),
                    ],
                  ),
                ),
                Tab(
                  child: Column(children: [
                    SizedBox(
                            height:28.h
                          ),
                    // VerticalSpacerWidget(28.h),
                    Text(
                        "Choose a stock icon for today.You can change it later when you find the perfect pic.",
                        textAlign: TextAlign.center,
                        style:AppTheme.lightTheme.textTheme.labelSmall),
                        SizedBox(
                            height:24.h
                          ),
                    // VerticalSpacerWidget(24.h),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.14.h,
                      child: GridView.builder(
                        // itemCount: Globals.gradientBackGroundCurveSvg.length,
                        gridDelegate:
                             SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 19,
                                childAspectRatio: 3,
                                crossAxisSpacing: BorderSide.strokeAlignCenter),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              print("=-------------------------$index");
                              // Utils.setBackgroundColorIndex(index);
                              // Utils.setprofilePath('');
                              Navigator.pop(context);
                              completer.complete(true);
                            },
                            // child: SvgPicture.asset(
                            //    Globals.gradientBackGroundCurveSvg[index],
                            //   height: 38.h,
                            //   width: 38.w,
                            //   // fit: BoxFit.fill,
                            // ),
                          );
                        },
                      ),
                    ),
                  ]),
                )
              ])),
        ],
      ),
    ),
  );
}

Widget _buildCircularContainer({Widget? child}) {
  return Container(
    height: 38.h,
    width: 38.w,
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: AppColors.blue),
    child: child,
  );
}

Future<void> openCamera(singupUploadPhotoViewAgentModel, BuildContext context,
    Completer<bool> completer) async {
  var image = await ImagePicker.platform
      .pickImage(source: ImageSource.camera, imageQuality: 50);

  if (image != null) {
    // singupUploadPhotoViewAgentModel.imagePath = image.path;
    // Utils.setprofilePath(image.path);
    Navigator.pop(context);
    completer.complete(true);
  } else {
    Navigator.pop(context);
  }
}

Future<void> imgFromGallery(singupUploadPhotoViewAgentModel,
    BuildContext context, Completer<bool> completer) async {
  var image = await ImagePicker.platform
      .pickImage(source: ImageSource.gallery, imageQuality: 50);

  if (image != null) {
    // singupUploadPhotoViewAgentModel.imagePath = image.path;
    // Utils.setprofilePath(image.path);
    Navigator.pop(context);
    completer.complete(true);
  } else {
    Navigator.pop(context);
  }
}