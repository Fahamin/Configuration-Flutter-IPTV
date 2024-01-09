import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:setup_config_wizard/providers/provider_riverpod.dart';
import 'package:setup_config_wizard/routes/routes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context,ref) {
    final isLightTheme = ref.watch(themeProvider);

    return GetMaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'IPTV',
        theme: isLightTheme?ThemeData.light():ThemeData.dark(),
        initialRoute: Routes.iptv,
        getPages: appRoutes());
  }
}
