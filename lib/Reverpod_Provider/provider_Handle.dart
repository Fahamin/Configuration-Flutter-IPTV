import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setup_config_wizard/model/m3u_Model.dart';

import '../DB/database_Helper.dart';

var themeProvider = StateProvider((ref) => true);

var isFav = StateProvider((ref) => 0);

final playListProvider = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllPlayList();
});

final channelListProvider = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllChannel();
});

final channelCategoryListProvider =
    FutureProvider.family<List<Map<String, dynamic>>, String>((ref, cat) async {
  return await SQLHelper.getChannelByCategory(cat);
});

final favListProvider =
    FutureProvider.family<List<Map<String, dynamic>>, String>((ref, fav) async {
  return await SQLHelper.getChannelFavList(fav);
});



final listFavProvider = StateNotifierProvider<FavoriteController, List<Map<String, dynamic>>>(
        (ref) {
      return FavoriteController();
    });

class FavoriteController extends StateNotifier<List<Map<String, dynamic>>> {
  FavoriteController() : super([]);

  void addToFav(int index, List<Map<String, dynamic>> data) {
    data[index]['isFavorite'] = true;
    final result =
    data.where((element) => element['isFavorite'] == true).toList();
    state = [...result];
  }

  void removeFromFav(int id) {
    for (final item in state) {
      if (item['id'] == id) {
        item['isFavorite'] = false;
      }
    }
    final result =
    state.where((element) => element['isFavorite'] == true).toList();
    state = [...result];
  }
}