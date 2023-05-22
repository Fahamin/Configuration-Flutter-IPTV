

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setup_config_wizard/model/m3uModel.dart';

import '../DB/sqfliteHelper.dart';

final playListProvidr = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllPlayList();
});

final channelListProvider = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllChannel();
});

final channelCatgoryListProvider =
    FutureProvider.family<List<Map<String, dynamic>>, String>((ref, cat) async {
  return await SQLHelper.getChannelByCategory(cat);
});
