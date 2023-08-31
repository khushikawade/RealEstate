import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/Image_widgets.dart';
import 'package:realstate/ui/user_module/registration_module/registration_model.dart';

import 'package:realstate/utils/app_colors.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/constant.dart';

class ImagePickerWidget extends StatefulWidget {
  ImagePickerWidget({
    
    super.key,
  });
  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}



// bool isLoading = false;

// String? imageurlpro;
// XFile? url;

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
      final model = Provider.of<registrationModel>(context);
    return InkWell(
        onTap: () {
          imagesBottomSheet(context,model);
        },
        // child:
        child: model.url != null ? imageWidget(model.url!,model) : dottedBorder());
  }

  Widget imageWidget(XFile image,registrationModel model) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 57.h,
          backgroundImage: FileImage(File(image.path)),
          // child: Image.file(
          //   File(image.path),
          //   fit: BoxFit.cover,
          // ),
        )
      ],
    );
  }

  // Widget imageCard(XFile image) {
  //   return Stack(children: [
  //     Container(
  //         width: 100.w,
  //         height: 130.h, //height of inner container

  //         decoration: BoxDecoration(
  //           color: AppColors.green,
  //           borderRadius: BorderRadius.circular(23),
  //         ),
  //         child: ClipRRect(
  //             borderRadius: BorderRadius.circular(18),
  //             child: Image.file(
  //               frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) {
  //                 if (wasSynchronouslyLoaded) return child;

  //                 return frame != null ? child : CircularProgressIndicator();
  //               }),
  //               File(image.path),
  //               fit: BoxFit.fill,
  //             ))),
  //     Positioned(
  //       bottom: 1,
  //       child: Container(
  //         width: 32.w,
  //         height: 32.h,
  //         decoration: ShapeDecoration(
  //             shape: CircleBorder(), color: AppColors.primaryColor),
  //         child: IconButton(
  //           onPressed: () {
  //             imagesBottomSheet(context,model);
  //           },
  //           icon: Icon(
  //             Icons.edit,
  //             color: Colors.white,
  //             size: 18.sp,
  //           ),
  //         ),
  //       ),
  //     )
  //   ]);
  // }

  imagesBottomSheet(BuildContext context,registrationModel model) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE

          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Photos",
                      style: AppTheme.lightTheme.textTheme.labelSmall),
                  onTap: () {
                    _imgFromGallery(context,model);
                  }),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: Text("Camera",
                    style: AppTheme.lightTheme.textTheme.labelSmall),
                onTap: () {
                  Navigator.of(context).pop();

                  _cameraImage(context,model);
                },
              ),
            ],
          );
        });
  }

  _imgFromGallery(BuildContext context,registrationModel model) async {
    model.isLoading = true;
    // setState(() {
    //   isLoading = true;
    // });

    XFile? pickedFile = (await model.picker.pickImage(
        source: ImageSource.gallery, preferredCameraDevice: CameraDevice.rear));

    if (pickedFile != null) {
      model.url = pickedFile;
      // setState(() {
      //   model.url = pickedFile;
      // });

      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
    model.isLoading = false;

    // setState(() {
    //   isLoading = false;
    // });
  }

  Future<void> _cameraImage(BuildContext context,registrationModel model) async {
    final XFile? camera = await model.picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);

    if (camera != null) {
      setState(() {
        model.url = camera;

        // widget.subtitle == 'front' ? url = camera : backurl = camera;
      });

      Navigator.pop(context);
    } else {
      Navigator.pop(context);
    }
  }

  Widget dottedBorder() {
    return headingImage(Constants.verifyImage);
    
  }
}
