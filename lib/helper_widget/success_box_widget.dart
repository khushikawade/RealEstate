import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';


class SuccessBoxWidget extends StatefulWidget {
  final String? title;
  final String? img;
  Function? onClick;
  SuccessBoxWidget({
    Key? key,
    this.title,
    this.img,
    this.onClick,
  }) : super(key: key);

  @override
  State<SuccessBoxWidget> createState() => _SuccessBoxWidgetState();
}

class _SuccessBoxWidgetState extends State<SuccessBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: ClipRect(
              child: Container(
                  margin: EdgeInsets.only(left: 30.h, right: 30.h),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      widget.img == null
                          ? Image.asset(
                              'assets/check_success.gif',
                              fit: BoxFit.fill,
                              height: 50,
                            )
                          : Image.asset(
                              widget.img.toString(),
                              fit: BoxFit.fill,
                            ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        "SUCCESS",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18.sp,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.44,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(widget.title ?? "Oops Something Went Wrong",
                          style: TextStyle(
                            color: const Color(0xff2A2A2A),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          )),
                      SizedBox(
                        height: 12.h,
                      ),
                      const Divider(
                        color: AppColors.grey,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        child: Text(
                          "OK",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.10,
                              color: AppColors.green),
                        ),
                        onTap: () {
                          //navigationService.back();
                          if (widget.onClick != null) {
                            Navigator.pop(context);
                            widget.onClick!();
                          } else {
                            Navigator.pop(context);
                          }

                          //widget.callBack!(true);
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  )),
            ),
            onTap: () {
              //navigationService.back();
              if (widget.onClick != null) {
                Navigator.pop(context);
                widget.onClick!();
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
