import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:realstate/ui/user_module/Registration_module/registration_model.dart';
import 'package:realstate/ui/user_module/Registration_module/registration_screen.dart';
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
             ChangeNotifierProvider(
             create: (_) => OnBoardingViewModel()),
             ChangeNotifierProvider(
             create: (_) =>  LoginViewModel(context: context)),
             ChangeNotifierProvider(
             create: (_) =>  VerificationModel(context: context)),
              ChangeNotifierProvider(
             create: (_) =>  registrationModel(context: context)),
             ChangeNotifierProvider(
             create: (_) =>  WaitListScreenModel(context: context)),

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
                            '/verify_mobile_number_screen': (context) => VerificationScreen(),
                             '/success_screen': (context) => RegistrationScreen(),
                             '/waitlist_screen': (context) => WaitListScreen(),
                                
                            },     
                     navigatorKey: AppUtil.navigationKey,
                  );
                });
          },
        ));
  }
}
