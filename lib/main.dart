import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Controller/all_controller_binding.dart';
import 'Reverpod_Provider/provider_Handle.dart';
import 'Route_Manage/routes_Manage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context,ref) {
    final isLightTheme = ref.watch(themeProvider);

    return GetMaterialApp(
        initialBinding: AllControllerBinding(),
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'IPTV',
        theme: isLightTheme?ThemeData.light():ThemeData.dark(),
        initialRoute: Routes.homePage,
        getPages: appRoutes());
  }
}
