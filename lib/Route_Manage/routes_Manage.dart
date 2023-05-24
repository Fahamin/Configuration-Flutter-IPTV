import 'package:get/get.dart';

import '../Pages/build_Page.dart';
import '../Pages/home_Page.dart';
import '../Pages/iptv_Page.dart';
import '../Pages/m3u_Page.dart';
import '../Pages/nexus_Addons.dart';
import '../Pages/player_Page.dart';
import '../Pages/player_Page2.dart';
import '../Pages/playlist_Page.dart';



class Routes {
  static String homePage = '/homepage';

  static String splashScreen = '/splashScreen';

  static String m3uPage = '/m3uPage';

  static String playlist = '/playlist';

  static String buildPage = '/buildPage';

  static String iptv = '/iptv';

  static String player = '/player';

  static String player2 = '/player2';

  static String nexusAddons = '/nexusAddons';

  static String productPage = '/productPage';
}

appRoutes() => [
      GetPage(
        name: Routes.homePage,
        page: () => HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      // GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
      GetPage(
        name: Routes.m3uPage,
        page: () => M3uPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.playlist,
        page: () => PlaylistPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.buildPage,
        page: () => BuildPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.iptv,
        page: () => IptvPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.player,
        page: () => PlayerPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.player2,
        page: () => PlayerPage2(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),

      GetPage(
        name: Routes.nexusAddons,
        page: () => NexusAddons(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
