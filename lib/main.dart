import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/ui/home_module/form_view/form_view_model.dart';
import 'package:realstate/ui/previous_post_module/PreviousPostScreen/previous_post_model.dart';
import 'package:realstate/ui/previous_post_module/PreviousPostScreen/previous_post_screen.dart';
import 'package:realstate/ui/home_module/Home_view/home_view.dart';
import 'package:realstate/ui/home_module/Home_view/home_view_model.dart';
import 'package:realstate/ui/home_module/success_module/success_model.dart';
import 'package:realstate/ui/home_module/success_module/success_screen.dart';
import 'package:realstate/ui/home_module/profile_module/profile_screen_model.dart';
import 'package:realstate/ui/home_module/home_screen/home_screen_model.dart';
// import 'package:realstate/ui/user_module/Registration_module/image_picker.dart';
import 'package:realstate/ui/user_module/registration_module/registration_model.dart';
import 'package:realstate/ui/user_module/registration_module/registration_screen.dart';
import 'package:realstate/ui/user_module/login_module/login_screen.dart';
import 'package:realstate/ui/user_module/login_module/login_view_model.dart';
import 'package:realstate/ui/user_module/onboarding_module/onboarding_page.dart';
import 'package:realstate/ui/user_module/onboarding_module/onboarding_view_model.dart';
import 'package:realstate/ui/user_module/splash_module/splash_screen.dart';
import 'package:realstate/ui/user_module/splash_module/splash_view_model.dart';
import 'package:realstate/ui/user_module/verify_number_module/verification_model.dart';
import 'package:realstate/ui/user_module/verify_number_module/verification_screen.dart';
import 'package:realstate/ui/waitlist/waitlist_model.dart';
import 'package:realstate/utils/app_theme.dart';
import 'package:realstate/utils/app_util.dart';

import 'ui/waitlist/waitlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => SplashScreenModel(context: context)),
          ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
          ChangeNotifierProvider(
              create: (_) => LoginViewModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => VerificationModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => registrationModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => WaitListScreenModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => HomeScreenModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => HomeViewModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => ProfileScreenModel(context: context)),
          ChangeNotifierProvider(
              create: (_) => FormViewModel(context: context)),
          ChangeNotifierProvider(
               create: (_) => SuccessScreenModel()),
           ChangeNotifierProvider(
               create: (_) => PreviousPostModel(context: context)),
        ],
        child: ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return AdaptiveTheme(
                light: AppTheme.lightTheme,
                dark: AppTheme.lightTheme,
                initial: AdaptiveThemeMode.light,
                debugShowFloatingThemeButton: false,
                builder: (ThemeData lightTheme, ThemeData darkTheme) {
                  return MaterialApp(
                    //  locale: model.appLocal,
                    title: 'Real State',
                    debugShowCheckedModeBanner: false,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    initialRoute: '/',
                    routes: {
                      '/': (context) => SplashScreen(),
                      '/splash': (context) => SplashScreen(),
                      '/onboarding_section': (context) => OnBoardingPage(),
                      '/login_screen': (context) => LoginScreen(),
                      '/Verification_screen': (context) =>VerificationScreen(),
                      '/registration_screen': (context) => RegistrationScreen(),
                      '/waitlist_screen': (context) => WaitListScreen(),
                      '/home_screen': (context) => HomeScreen(),
                      '/success_screen': (context) =>  SuccessScreen(),
                      '/previouspost_screen': (context) =>  PreviousPostScreen(),
                    },
                    navigatorKey: AppUtil.navigationKey,
                  );
                });
          },
        ));
  }
}
