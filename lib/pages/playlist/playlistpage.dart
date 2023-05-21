import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setup_config_wizard/ProviderHandaler/ProviderHandle.dart';

import '../../DB/sqfliteHelper.dart';
import '../../navigation/nav_Drawer.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlayList"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
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
