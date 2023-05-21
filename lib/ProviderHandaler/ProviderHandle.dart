import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../DB/sqfliteHelper.dart';

final playListProvidr = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllPlayList();
});

final channelListProvider = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllChannel();
});

