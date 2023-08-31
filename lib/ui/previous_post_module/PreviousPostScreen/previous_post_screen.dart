import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:realstate/custom_fonts/real_state_icons.dart';
import 'package:realstate/helper_widget/prvious_post_appbar.dart';
import 'package:realstate/helper_widget/text_widgets.dart';
import 'package:realstate/ui/previous_post_module/PreviousPostScreen/previous_post_model.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/constant.dart';

class PreviousPostScreen extends StatefulWidget {
  const PreviousPostScreen({super.key});

  @override
  _PreviousPostScreenState createState() => _PreviousPostScreenState();
}

class _PreviousPostScreenState extends State<PreviousPostScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final priviosPostModel =
          Provider.of<PreviousPostModel>(context, listen: false);

      priviosPostModel.initialApiCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PreviousPostModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: PriviousPostAppBar(Constants.previousPost, true),
        ),
        body: PreviousPostView(
          context,
          model,
        ),
      ),
    );
  }

  Widget PreviousPostView(BuildContext context, PreviousPostModel model) {
    List<String> items = List.generate(25, (index) => "Item ${index + 1}");
    return Padding(
        padding: EdgeInsets.fromLTRB(0.h, 10.h, 0.h, 10.h),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 25,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemBuilder: (context, index) {
              return Slidable(
                  key: const ValueKey(1),
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                    extentRatio: 0.30,
                    // dismissible: DismissiblePane(onDismissed: () {}),
                    children: [
                      Slideblecontainer(
                        icon: RealState.check,
                        label: 'Matches',
                        backgroundColor: AppColors.timer,
                        marginCheck: true,
                        onPressed: (context) {
                          model.leftslidecallback(context, index);
                        },
                      ),

                      // Flexible(
                      //   flex: 1,
                      //   fit: FlexFit.tight,
                      //   child: Container(
                      //     child: SlidableAction(
                      //       borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(12.h),
                      //         bottomRight: Radius.circular(12.h),
                      //       ),
                      //       onPressed: (context) {
                      //          model.leftslidecallback(index);
                      //       },
                      //       foregroundColor: Colors.white,
                      //       backgroundColor: AppColors.timer,
                      //       icon: RealState.check,
                      //       label: 'Matches',
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    extentRatio: 0.30,
                    children: [
                      Slideblecontainer(
                        icon: RealState.delete,
                        label: 'Delete',
                        backgroundColor: AppColors.slidebackground,
                        marginCheck: false,
                        onPressed: (context) {
                          model.leftslidecallback(context, index);
                        },
                      ),

                      // Flexible(
                      //   flex: 1,
                      //   fit: FlexFit.tight,
                      //   child: Container(
                      //     child: SlidableAction(
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(12.h),
                      //         bottomLeft: Radius.circular(12.h),
                      //       ),
                      //       onPressed: (context) {
                      //         model.leftslidecallback(index);
                      //       },
                      //       foregroundColor: Colors.white,
                      //       icon: RealState.delete,
                      //       label: 'Delete',
                      //       backgroundColor: AppColors.slidebackground,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  child: PreviousPostListTile(context, model, index, items));
            }));
  }

  Widget PreviousPostListTile(BuildContext context, model, int index, items) {
    return Container(
        margin: EdgeInsets.only(left: 10.h, right: 10.h),
         padding: EdgeInsets.fromLTRB(10.h, 0.h, 0.h, 10.h),
        decoration: BoxDecoration(
          border: Border.all(width: 1.h, color: AppColors.greyLight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Text(items[index], style: TextStyle(color: Colors.black)),
            ListTile(
              minVerticalPadding: 0.h,
              
              contentPadding: EdgeInsets.only(
                left: 0.h,
              ),
              leading: CircleAvatar(
                backgroundColor: AppColors.homeIcon,
                child: onboardingLabelWidget('B', context),
              ),
              title: ListTileHeading("Buy", context),
              subtitle: ListTileSubheading("#123456789", context),
              trailing: ClipPath(
                clipper: AngleClipper(),
                child: Container(
                  width: 100.h,
                  padding: EdgeInsets.fromLTRB(5.h, 5.h, 5.h, 5.h),
                  color: AppColors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width:3.h
                      // ),
                      previousPostMatches("3" ," Matches", context),
                       SizedBox(
                        width:3.h
                      ),
                     Icon(
                        RealState.keyboard_arrow_right,
                        size: 16.h,
                        color: AppColors.white,
                      ), 
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: AppColors.greyLight,
              height: 5.h,
              thickness: 1.h,
              indent: 5.h,
              endIndent: 5.h,
            ),
            SizedBox(height: 5.h,),
            Container(
              padding: EdgeInsets.only(right:10.h),
              child: Column(
                children: [
                  SizedBox(
                    child: ListTilecontaint(
                        'Residential Plot | 5000 SQFT | East Facing | Shanti Vista - Nipaniya',
                        context),
                  ),
                   SizedBox(height: 10.h,),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          RealState.calendar_full,
                          size: 10.h,
                          color: AppColors.buttonColor,
                        ),
                        SizedBox(
                          width:5.h
                        ),
                        ListTilecontaint('08-02-2023', context),
                        SizedBox(
                          width:10.h
                        ),
                        Icon(
                          RealState.letter_unread,
                          size: 10.h,
                          color: AppColors.buttonColor,
                        ),
                        SizedBox(
                          width:5.h
                        ),
                        ListTilecontaint('100', context),
                      ],
                    ),
                  ),
                ],
              )
                ],
              ),
            ),
            
          ],
        ));
  }
}

class Slideblecontainer extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color? backgroundColor;
  final bool marginCheck;
  final SlidableActionCallback? onPressed;
  Slideblecontainer(
      {this.icon,
      this.label,
      this.backgroundColor,
      required this.marginCheck,
      required this.onPressed}) {}

  @override
  Widget build(BuildContext context) {
    final controller = Slidable.of(context);
    return ValueListenableBuilder<double>(
        valueListenable: controller!.animation,
        builder: (context, value, child) {
          return
              // Flexible(
              //   flex: 1,
              //   fit: FlexFit.tight,
              // child:

              SlidableAction(
            borderRadius: BorderRadius.only(
              topRight: marginCheck == true
                  ? Radius.circular(12.h)
                  : Radius.circular(0.h),
              bottomRight: marginCheck == true
                  ? Radius.circular(12.h)
                  : Radius.circular(0.h),
              topLeft: marginCheck == true
                  ? Radius.circular(0.h)
                  : Radius.circular(12.h),
              bottomLeft: marginCheck == true
                  ? Radius.circular(0.h)
                  : Radius.circular(12.h),
            ),
            onPressed: onPressed,
            backgroundColor: backgroundColor!,
            foregroundColor: Colors.white,
            icon: icon,
            label: label,
          );
          // );
        });
  }
}

class AngleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.15, 0); // Create the triangular shape
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
