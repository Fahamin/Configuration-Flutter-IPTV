import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'RouteManage/routesall.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('shopping_box');
  await Hive.openBox('testBox');

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return GetMaterialApp(
              // Remove the debug banner
              debugShowCheckedModeBanner: false,
              title: 'IPTV',
              theme: ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Colors.green,
                  primarySwatch: Colors.green),
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
              initialRoute: Routes.homePage,
              getPages: appRoutes());
        });
  }
}