import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/helper_widget/Text_widgets.dart';
import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_size.dart';

class ButtonWidget extends StatefulWidget {
  String? title;
  var backgroundcolorname;
  var textcolor;
  var bordercolor;
  VoidCallback callBack;
  bool? isLoading;

  ButtonWidget({
    super.key,
    this.title,
    this.backgroundcolorname,
    this.textcolor,
    this.bordercolor,
    required this.callBack,
    this.isLoading,
  });
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: widget.callBack,
      child: Container(
        height: AppSize.buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: widget.backgroundcolorname,
          border: Border.all(
            width: 1,
            color: widget.bordercolor,
          ),
          
        ),
        child: widget.isLoading == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    buttonTextWidget(widget.title.toString(),context),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height *
                              0.02),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.034,
                        width: MediaQuery.of(context).size.height *
                            0.034,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ])
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Center(
                      child: buttonTextWidget(widget.title.toString(),context),
                    ),
                  ]),
      ),
    );
  }
}
