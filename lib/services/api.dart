import 'dart:convert';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:realstate/services/api_client.dart';
import 'package:realstate/services/api_methods.dart';
import 'package:realstate/services/models/get_otp_resp_model.dart';
import 'package:realstate/services/models/otp_verify_resp_model.dart';
import 'package:realstate/services/models/register_user_resp_model.dart';
import 'package:realstate/utils/app_util.dart';
import 'package:realstate/utils/constant.dart';
import 'package:realstate/utils/shared_pref.dart';

@lazySingleton
class Api {
  final ApiEndpoints _apiMethods = ApiEndpoints();
  final ApiClient _apiClient = ApiClient();

  //Get Otp  API

  Future<GetOtpResp> getOtpApi(var body) async {
    bool internet = await AppUtil.checkNetwork();
    if (!internet) {
      return GetOtpResp(error: Constants.noInternet, status: 501);
    }
    Response response = await _apiClient.postMethod(
      _apiMethods.get_otp,
      body,
    );

    if (response.statusCode == 200) {
      try {
        if (response.body.contains('error')) {
          var jsonResponse = json.decode(response.body);
          return GetOtpResp(
              error: jsonResponse['error']['message'], status: 500);
        } else {
          GetOtpResp resp = getOtpRespFromJson(response.body);
          resp.status = response.statusCode;
          return resp;
        }
      } catch (e) {
        return GetOtpResp(error: e.toString(), status: response.statusCode);
      }
    } else if (response.statusCode == 422) {
      var jsonResponse = json.decode(response.body);
      return GetOtpResp(
          error: jsonResponse["message"], status: response.statusCode);
    } else {
      var jsonResponse = json.decode(response.body);
      return GetOtpResp(
          error: jsonResponse["message"], status: response.statusCode);
    }
  }

  //  Otp Verify API

  Future<OtpVerifyResp> otpVerifyApi(var body) async {
    bool internet = await AppUtil.checkNetwork();
    if (!internet) {
      return OtpVerifyResp(error: Constants.noInternet, status: 501);
    }
    Response response = await _apiClient.postMethod(
      _apiMethods.otp_verify,
      body,
    );
   

    if (response.statusCode == 200) {
      print(response.statusCode);
      
      try {
        if (response.body.contains('error')) {
          var jsonResponse = json.decode(response.body);
          return OtpVerifyResp(
              error: jsonResponse['error']['message'], status: 500);
        } else {
          OtpVerifyResp resp = otpVerifyRespFromJson(response.body);
          resp.status = response.statusCode;
          return resp;
        }
      } catch (e) {
        return OtpVerifyResp(error: e.toString(), status: response.statusCode);
      }
    } else if (response.statusCode == 422) {
      var jsonResponse = json.decode(response.body);
      return OtpVerifyResp(
          error: jsonResponse["message"], status: response.statusCode);
    } else {
      var jsonResponse = json.decode(response.body);
      return OtpVerifyResp(
          error: jsonResponse["message"], status: response.statusCode);
    }
  }

  // Register API
  Future<RegisterUserResp> registerApi(var body) async {
    bool internet = await AppUtil.checkNetwork();
    if (!internet) {
      return RegisterUserResp(error: Constants.noInternet, status: 501);
    }
    Response response = await _apiClient.postMethod(
      _apiMethods.register_user,
      body,
    );
     print("hello");
     print(response);

    if (response.statusCode == 200) {
      try {
        if (response.body.contains('error')) {
          var jsonResponse = json.decode(response.body);
          return RegisterUserResp(
              error: jsonResponse['error']['message'], status: 500);
        } else {
          RegisterUserResp resp = registerUserRespFromJson(response.body);
          resp.status = response.statusCode;
          return resp;
        }
      } catch (e) {
        return RegisterUserResp(
            error: e.toString(), status: response.statusCode);
      }
    } else if (response.statusCode == 422) {
      var jsonResponse = json.decode(response.body);
      return RegisterUserResp(
          error: jsonResponse["message"], status: response.statusCode);
    } else {
      var jsonResponse = json.decode(response.body);
      return RegisterUserResp(
          error: jsonResponse["message"], status: response.statusCode);
    }
  }

  //Get Otp  API
  // Future<LocationApiResponse> getLocationApi() async {
  //   String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
  //   bool internet = await AppUtil.checkNetwork();
  //   if (!internet) {
  //     return LocationApiResponse(error: Constants.noInternet, status: 501);
  //   }
  //   Response response = await _apiClient.getMethod(
  //     '${_apiMethods.getLocation}2229',
  //     headers: token != null && token.isNotEmpty
  //         ? {"Authorization": "Bearer $token"}
  //         : null,
  //   );

  //   if (response.statusCode == 200) {
  //     try {
  //       if (response.body.contains('error')) {
  //         var jsonResponse = json.decode(response.body);
  //         return LocationApiResponse(
  //             error: jsonResponse['error']['message'], status: 500);
  //       } else {
  //         LocationApiResponse resp = locationApiResponseFromJson(response.body);
  //         resp.status = response.statusCode;
  //         return resp;
  //       }
  //     } catch (e) {
  //       return LocationApiResponse(
  //           error: e.toString(), status: response.statusCode);
  //     }
  //   } else if (response.statusCode == 422) {
  //     var jsonResponse = json.decode(response.body);
  //     return LocationApiResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   } else {
  //     var jsonResponse = json.decode(response.body);
  //     return LocationApiResponse(
  //         error: jsonResponse["message"], status: response.statusCode);
  //   }
  // }

//   //Get user profile API
//   Future<UserProfileResponse> getUserProfile() async {
//     String token = await SharedPre.getStringValue(SharedPre.LOGIN_TOKEN);
//     bool internet = await AppUtil.checkNetwork();
//     if (!internet) {
//       return UserProfileResponse(error: Constants.noInternet, status: 501);
//     }
//     Response response = await _apiClient.getMethod(
//       _apiMethods.getUserProfile,
//       headers: token != null && token.isNotEmpty
//           ? {"Authorization": "Bearer $token"}
//           : null,
//     );

//     if (response.statusCode == 200) {
//       try {
//         if (response.body.contains('error')) {
//           var jsonResponse = json.decode(response.body);
//           return UserProfileResponse(
//               error: jsonResponse['error']['message'], status: 500);
//         } else {
//           UserProfileResponse resp = userProfileResponseFromJson(response.body);
//           resp.status = response.statusCode;
//           return resp;
//         }
//       } catch (e) {
//         return UserProfileResponse(
//             error: e.toString(), status: response.statusCode);
//       }
//     } else if (response.statusCode == 422) {
//       var jsonResponse = json.decode(response.body);
//       return UserProfileResponse(
//           error: jsonResponse["message"], status: response.statusCode);
//     } else {
//       var jsonResponse = json.decode(response.body);
//       return UserProfileResponse(
//           error: jsonResponse["message"], status: response.statusCode);
//     }
//   }
}
