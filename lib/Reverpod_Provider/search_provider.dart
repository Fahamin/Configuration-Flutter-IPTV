import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchUserController, List>((ref) {
  return SearchUserController();
});

final searchUserProvider = StateProvider<String>((ref) => '');

class SearchUserController extends StateNotifier<List> {
  SearchUserController() : super([]);

  void onSearchUser(String query, List<dynamic> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .contains(query.toString().toLowerCase()))
          .toSet()
          .toList();
      state.addAll(result);
    }
  }
}
