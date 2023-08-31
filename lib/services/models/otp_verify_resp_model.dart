import 'dart:convert';
OtpVerifyResp otpVerifyRespFromJson(String str) => OtpVerifyResp.fromJson(json.decode(str));
String otpVerifyRespToJson(OtpVerifyResp data) => json.encode(data.toJson());

class OtpVerifyResp {
    String? message;
    String? accessToken;
    Data? data;
    String? error;
    int? status;

    OtpVerifyResp({
         this.message,
         this.accessToken,
         this.data,
         this.error,
         this.status,
    });

    factory OtpVerifyResp.fromJson(Map<String, dynamic> json) => OtpVerifyResp(
        message: json["message"],
        accessToken: json["access_token"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
        status: json["status"]
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "data": data!.toJson(),
        "status": status,
        "error": error
    };
}

class Data {
    int id;
    int roleId;
    dynamic fullName;
    dynamic email;
    String mobile;
    DateTime emailVerifiedAt;
    dynamic mobileVerifiedAt;
    String otp;
    dynamic dateOfBirth;
    dynamic androidDeviceId;
    dynamic appleDeviceId;
    dynamic googleId;
    String notification;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    Data({
        required this.id,
        required this.roleId,
        required this.fullName,
        required this.email,
        required this.mobile,
        required this.emailVerifiedAt,
        required this.mobileVerifiedAt,
        required this.otp,
        required this.dateOfBirth,
        required this.androidDeviceId,
        required this.appleDeviceId,
        required this.googleId,
        required this.notification,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        roleId: json["role_id"],
        fullName: json["full_name"],
        email: json["email"],
        mobile: json["mobile"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        mobileVerifiedAt: json["mobile_verified_at"],
        otp: json["otp"],
        dateOfBirth: json["date_of_birth"],
        androidDeviceId: json["android_device_id"],
        appleDeviceId: json["apple_device_id"],
        googleId: json["google_id"],
        notification: json["notification"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "full_name": fullName,
        "email": email,
        "mobile": mobile,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "mobile_verified_at": mobileVerifiedAt,
        "otp": otp,
        "date_of_birth": dateOfBirth,
        "android_device_id": androidDeviceId,
        "apple_device_id": appleDeviceId,
        "google_id": googleId,
        "notification": notification,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
