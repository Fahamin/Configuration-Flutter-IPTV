import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../sqlhelpterdb.dart';

final playListProvidr = FutureProvider.autoDispose((ref) async {
  return await SQLHelper.getAllPlayList();
});
