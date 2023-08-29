import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/prviousPostAppar.dart';
import 'package:realstate/ui/PreviousPostModule/PreviousPostScreen/PreviousPostModel.dart';
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

  Widget PreviousPostView(BuildContext context, model) {
    List<String> items = List.generate(25, (index) => "Item ${index + 1}");
    return Padding(
        padding: EdgeInsets.fromLTRB(15.h, 10.h, 15.h, 10.h),
        child: ListView.builder(
            itemCount: 25,
            itemBuilder: (context, index) {
              return SwipeActionCell(
                  key: ObjectKey(items[index]),
                  trailingActions: [
                    SwipeAction(
                      content: Icon(Icons.delete, color: Colors.white),
                      color: Colors.red,
                      onTap: (handler) async {
                        await handler(true);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                            "Item deleted",
                          )),
                        );
                      },
                    ),
                  ],
                  leadingActions: [
                    SwipeAction(
                      content: Icon(Icons.check, color: Colors.white),
                      color: Colors.green,
                      onTap: (handler) async {
                        await handler(true);
                        // Call your check function here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Item checked")),
                        );
                      },
                    ),
                  ],
                  // child: ListTile(
                  //   title: Text(items[index],style:TextStyle(color:Colors.black)),),
                  child: PreviousPostListTile(context, model, index, items));
            }));
  }

  Widget PreviousPostListTile(BuildContext context, model, int index, items) {
    return Padding(
      padding: EdgeInsets.only(bottom:10.h),
      child: Container(
          padding: EdgeInsets.fromLTRB(10.h, 10.h, 0.h, 10.h),
          decoration: BoxDecoration(
            border: Border.all(width: 1.h, color: AppColors.greyLight),
            borderRadius: BorderRadius.circular(12),
          ),
          child: 
          // Text(items[index],style:TextStyle(color:Colors.black)),
           Column(
             children: [
              Text(items[index],style:TextStyle(color:Colors.black)),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.homeIcon,
                  child: Text("B"),
                ),
                title: Text("Buy"),
                subtitle: Text("#123456789"),
                trailing: Container(
                  padding: EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 10.h),
                  color: AppColors.green,
                  child: Text('3 matches'),
                ),
              ),
              Divider(
                color: AppColors.greyLight,
                height: 5.h,
                thickness: 1.h,
                indent: 5.h,
                endIndent: 5.h,
              ),
              //  Expanded(child: Text('Residential Plot | 5000 SQFT | East Facing | Shanti Vista - Nipaniya')),
              Row(children: [
                Text("hello"),
              ],)
             ],
           )
          ),
    );
  }
}
