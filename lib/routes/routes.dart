import 'package:get/get.dart';

import '../screen/fav_page.dart';
import '../screen/iptv_Page.dart';
import '../screen/m3u_Page.dart';
import '../screen/player_Page.dart';
import '../screen/player_Page2.dart';
import '../screen/playlist_Page.dart';

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

  static String favPage = '/favPage';
}

appRoutes() => [

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
        name: Routes.favPage,
        page: () => FavoritePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
