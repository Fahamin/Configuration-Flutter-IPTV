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
                  Get.toNamed(Routes.playlist);
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("M3u Page"),
                leading: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.m3uPage);


                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Favorite List"),
                leading: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                ),
                onTap: () {
                  Get.off("");
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Contact"),
                leading: IconButton(
                  icon: Icon(Icons.contact_page),
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
