import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:realstate/utils/app_util.dart';

class PreviousPostModel extends ChangeNotifier {
  PreviousPostModel({required BuildContext context}) {}
  final controller = Slidable.of(AppUtil.getContext());
  leftslidecallback(BuildContext context,index) {
    print("left swipe $index");
  }
   rightslidecallback(BuildContext context, index) {
    print("Right swipe $index");
  }

  initialApiCall() {}
  sortbyOntap() {
    print("sortby On tap");
  }
}
