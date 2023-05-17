import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../nav_drawerpage/nav_Drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        drawer: const NavDrawer(),
        appBar: AppBar(
          title: Text(
            "Homepage",
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
                icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode),
                onPressed: () {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                }),
          ],
        ),
      );
    }

}
