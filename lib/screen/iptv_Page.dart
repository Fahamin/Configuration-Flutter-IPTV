import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
              // tab button border
              tabShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
              ],
              // tab button shadow
              curve: Curves.easeOutExpo,
              // tab animation curves
              duration: Duration(milliseconds: 200),
              // tab animation duration
              gap: 8,
              backgroundColor:Colors.black,
              // the tab button gap between icon and text
              color: Colors.white,
              // unselected icon color
              activeColor: Colors.white,
              // selected icon and text color
              iconSize: 24,
              // tab button icon size
              tabBackgroundColor: Colors.grey.shade800,
              // selected tab background color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              onTabChange: (index) {
                _onItemTapped(index);
              },
              // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.mms,
                  text: 'M3U',
                ),
                GButton(
                  icon: Icons.link,
                  text: 'PlayList',
                ),

                GButton(
                  icon: Icons.tv,
                  text: 'Channel',
                )
              ]),
        ),
      ),
      body: Center(
        child: _page.elementAt(_selectedIndex),
      ),
    );
  }
}
