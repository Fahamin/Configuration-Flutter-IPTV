import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setup_config_wizard/pages/playlist/playlistprovider.dart';

import '../../sqlhelpterdb.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final playlistPro = ref.watch(playListProvidr);
          return playlistPro.when(
              error: (error, str) => Text("Not Found"),
              loading: () => Center(child: CircularProgressIndicator()),
              data: (list) {
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext con, int index) {
                      return ListTile(title: Text(list[index]['title']));
                    });
              });
        }),
      ),
    );
  }
}
