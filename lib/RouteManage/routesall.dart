import 'package:get/get.dart';
import 'package:setup_config_wizard/pages/build/build_page.dart';
import 'package:setup_config_wizard/pages/iptv_page.dart';
import 'package:setup_config_wizard/pages/player_page.dart';

import '../pages/homePage.dart';
import '../pages/m3u/m3u_Page.dart';
import '../pages/player_page2.dart';
import '../pages/playlist/playlistpage.dart';

class Routes {
  static String homePage = '/homepage';

  static String splashScreen = '/splashScreen';

  static String m3uPage = '/m3uPage';

  static String playlist = '/playlist';

  static String buildPage = '/buildPage';

  static String iptv = '/iptv';

  static String player = '/player';
  static String player2 = '/player2';

  static String detailsPage = '/detailsPage';

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
    ];
