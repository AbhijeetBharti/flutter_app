import 'dart:convert';

List<UserDataModel> userDataFromJson(String str) => List<UserDataModel>.from(
    json.decode(str).map((x) => UserDataModel.fromJson(x)));

class UserDataModel {
  UserDataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
