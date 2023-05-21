import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../RouteManage/routesall.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool themeChose = false;
    return Drawer(
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(
                        "Flutter Design",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Flutter Design Pactice",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text("Home"),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.homePage);
                },
              ),

              ListTile(
                title: Text("Build DownLoad"),
                leading: IconButton(
                  icon: Icon(Icons.dashboard_customize_rounded),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.buildPage);
                },
              ),

              ListTile(
                title: Text("M3U"),
                leading: IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.back();
                  Get.offNamed(Routes.m3uPage);
                },
              ),

              ListTile(
                title: Text("IPTV"),
                leading: IconButton(
                  icon: Icon(Icons.tv),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.iptv);
                },
              ),
              /*Divider(
                color: Colors.grey,
              ),*/
              ListTile(
                title: Text("Favorite List"),
                leading: IconButton(
                  icon: Icon(Icons.bookmark),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.off("");
                },
              ),

              ListTile(
                title: Text("Contact"),
                leading: IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.off("");
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
