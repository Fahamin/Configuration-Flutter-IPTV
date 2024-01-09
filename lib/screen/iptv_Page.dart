import 'package:flutter/material.dart';
import 'package:setup_config_wizard/screen/playlist_Page.dart';

import '../navigation/botom_Menu.dart';
import '../navigation/drawer_Menu.dart';
import 'channel_Page.dart';
import 'm3u_Page.dart';

 List _page = [
  M3uPage(),
  PlaylistPage(),
  ChannelPage(),
];

class IptvPage extends StatefulWidget {
  IptvPage({Key? key}) : super(key: key);

  @override
  State<IptvPage> createState() => _IptvPageState();
}

class _IptvPageState extends State<IptvPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*     appBar: AppBar(
        title: Text("IPTV"),
        centerTitle: true,
      ),

  */
      bottomNavigationBar: BottomMenu(
        selectedIndex: _selectedIndex,
        onclicked: _onItemTapped,
      ),
      body: Center(
        child: _page.elementAt(_selectedIndex),
      ),
    );
  }
}
