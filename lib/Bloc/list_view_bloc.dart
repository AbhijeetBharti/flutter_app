import 'package:flutter_app/DataModel/user_data_model.dart';
import 'package:flutter_app/Resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ListViewBloc {
  final _repository = Repository();

  final _userDataFetcher = PublishSubject<List<UserDataModel>>();
  Stream<List<UserDataModel>> get userData => _userDataFetcher.stream;

  fetchUserData() async {
    List<UserDataModel> data = await _repository.fetchUserData();
    _userDataFetcher.sink.add(data);
  }

  searchAndFilterByTitle(String searchText, List<UserDataModel> data) {
    if (searchText.isEmpty) {
      _userDataFetcher.sink.add(data);
    } else {
      List<UserDataModel> searchResult = [];
      for (UserDataModel userData in data) {
        if (userData.title!.contains(searchText)) {
          searchResult.add(userData);
        }
      }
      _userDataFetcher.sink.add(searchResult);
    }
  }
}

final listViewBloc = ListViewBloc();
