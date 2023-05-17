import 'package:get/get.dart';

import '../pages/homePage.dart';
import '../pages/m3u/m3u_Page.dart';
import '../pages/playlist/playlistpage.dart';

class Routes {
  static String homePage = '/homepage';

  static String splashScreen = '/splashScreen';

  static String m3uPage = '/m3uPage';

  static String playlist = '/playlist';

  static String createAccount = '/createAccount';

  static String cardPage = '/cardPage';

  static String categoryPage = '/categoryPage';

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
    ];
