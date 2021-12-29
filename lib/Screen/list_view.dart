import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/list_view_bloc.dart';
import 'package:flutter_app/DataModel/user_data_model.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listViewBloc.fetchUserData();
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: listViewBloc.userData,
          builder: (BuildContext context,
              AsyncSnapshot<List<UserDataModel>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration:
                        const InputDecoration(hintText: 'Search by title'),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      listViewBloc.searchAndFilterByTitle(
                          value, snapshot.data!);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('ID : '),
                                    Text(snapshot.data![index].id.toString()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text('User ID : '),
                                    Text(snapshot.data![index].userId
                                        .toString()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text('Title : '),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(
                                        snapshot.data![index].title.toString(),
                                        maxLines: 50,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text('Body : '),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(
                                        snapshot.data![index].body.toString(),
                                        maxLines: 50,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text('Error');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
