import 'package:flutter_app/DataModel/user_data_model.dart';
import 'package:flutter_app/Resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ListViewBloc {
  final _repository = Repository();

  final _userDataFetcher = PublishSubject<List<UserDataModel>>();
  Stream<List<UserDataModel>> get userData => _userDataFetcher.stream;

  List<UserDataModel> tempData = [];

  fetchUserData() async {
    List<UserDataModel> data = await _repository.fetchUserData();
    tempData = data;
    _userDataFetcher.sink.add(data);
  }

  searchAndFilterByTitle(String searchText) {
    if (searchText.isEmpty) {
      _userDataFetcher.sink.add(tempData);
    } else {
      List<UserDataModel> searchResult = [];
      for (UserDataModel userData in tempData) {
        if (userData.title!.contains(searchText)) {
          searchResult.add(userData);
        }
      }
      _userDataFetcher.sink.add(searchResult);
    }
  }
}

final listViewBloc = ListViewBloc();
