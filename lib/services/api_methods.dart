import 'package:injectable/injectable.dart';

@lazySingleton
class ApiEndpoints {
  String get_otp = 'getotp';
  String otp_verify = 'app/login';
  String register_user = 'user/updateprofile/my';
  String propertyForm = 'property/requirment/create';
  String getLocation = 'app/locations/';
  String getInvestmentCategories = 'app/investment/categories';
  String getSchedules = 'app/schedules';
  String getAmount = 'app/investment/amount';
  String createInvestmentProfile = 'app/profile/create';
  String getUserProfile = 'app/profile/my';
 
}
