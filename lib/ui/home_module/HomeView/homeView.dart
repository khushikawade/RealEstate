import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/helper_widget/app_bar.dart';
import 'package:realstate/helper_widget/bottomBar.dart';
import 'package:realstate/ui/home_module/HomeView/homeViewModel.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: AppBarWidget(),
          ),
          bottomNavigationBar: BottomBarWidget(model, context),
          body: model.children[model.currentIndex],
          ),
    );
  }
}