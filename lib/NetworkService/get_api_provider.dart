import 'package:flutter_app/Constants/url.dart';
import 'package:flutter_app/DataModel/user_data_model.dart';
import 'package:http/http.dart' as http;

class GetAPI {
  Future<List<UserDataModel>> getUserData() async {
    List<UserDataModel> fetchedData = [];
    try {
      var response = await http.get(Uri.parse(url));
      fetchedData = userDataFromJson(response.body.toString());
    } catch (e) {
      print(e);
    }
    return fetchedData;
  }
}
