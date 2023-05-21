import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setup_config_wizard/ProviderHandaler/ProviderHandle.dart';

import '../navigation/nav_Drawer.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL Channel"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer(
          builder: (context, ref, chile) {
            final channelList = ref.watch(channelListProvider);
            return channelList.when(
                data: (list) {
                  return ListView.builder(
                      itemBuilder: (BuildContext con, int index) {
                    return ListTile(
                      title: Text(list[index]['title']),
                    );
                  });
                },
                error: (error, str) => Text("Not Found"),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        ),
      ),
    );
  }
}
