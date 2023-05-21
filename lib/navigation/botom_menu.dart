import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onclicked;

  BottomMenu({Key? key, this.selectedIndex, required this.onclicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.manage_history), label: "M3U"),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "PlayList"),
        BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Channel")
      ],
      currentIndex: selectedIndex,
      onTap: onclicked,
      selectedItemColor: Colors.red[700],
      unselectedItemColor: Colors.black38,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      unselectedFontSize: 12,
    );
  }
}
