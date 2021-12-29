import 'dart:async';
import 'package:flutter_app/NetworkService/get_api_provider.dart';
import 'package:flutter_app/DataModel/user_data_model.dart';

class Repository {
  final userDataApiProvider = GetAPI();

  Future<List<UserDataModel>> fetchUserData() =>
      userDataApiProvider.getUserData();
}
