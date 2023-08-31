// To parse this JSON data, do
//
//     final getOtpResp = getOtpRespFromJson(jsonString);

import 'dart:convert';

GetOtpResp getOtpRespFromJson(String str) =>
    GetOtpResp.fromJson(json.decode(str));

String getOtpRespToJson(GetOtpResp data) => json.encode(data.toJson());

class GetOtpResp {
  String? message;
  Data? data;
  String? error;
  int? status;

  GetOtpResp({this.message, this.data, this.error, this.status});

  factory GetOtpResp.fromJson(Map<String, dynamic> json) => GetOtpResp(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  String mobile;
  int otp;
  int roleId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  DateTime emailVerifiedAt;
  List<Role> roles;

  Data({
    required this.mobile,
    required this.otp,
    required this.roleId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.emailVerifiedAt,
    required this.roles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mobile: json["mobile"],
        otp: json["otp"],
        roleId: json["role_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
        "role_id": roleId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };
}

class Role {
  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Pivot pivot;

  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  int modelId;
  int roleId;
  String modelType;

  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
      };
}
