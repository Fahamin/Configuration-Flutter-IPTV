import 'dart:async';
import 'dart:io';

import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/options/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../main.dart';
import '../navigation/nav_Drawer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _localPath;
  late bool _permissionReady;
  late TargetPlatform? platform;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        centerTitle: true,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Build", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {
                          _download();
                        },
                        child: _makeBox("Download", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Addons", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Open Kodi", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Boot Change", "assets/home/build.png"),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Remote", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Setup Guide", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child:
                            _makeBox("Build Update", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {
                          _completedProgress(context,"Cleaning...");
                        },
                        child: _makeBox("Clean", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Boot Change", "assets/home/build.png"),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Buffing Fix", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Auto Boot", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child:
                            _makeBox("Switch Builds", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Force KD", "assets/home/build.png"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: _makeBox("Backup KD", "assets/home/build.png"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _completedProgress(context,mes) async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      max: 100,
      msg: mes,
      completed: Completed(),
      // Completed values can be customized
      // Completed(completedMsg: "Downloading Done !", completedImage: AssetImage("images/completed.png"), completionDelay: 2500,),
      progressBgColor: Colors.transparent,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

/*
  _customDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }*/

  _makeBox(String name, String t) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Center(
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Image.asset(t),
            Text(
              name,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 12,
              ),
            )
          ]),
        ));
  }

  _download() {
    TextEditingController controller = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Download From URL'),
                DView.spaceHeight(),
                DInput(
                  controller: controller,
                  hint: "https://www.onehello.com/hello.zip",
                  label: 'Download',
                ),
                ElevatedButton(
                    onPressed: () async {
                      var type = _getUrlMimeType(controller.text);
                      _permissionReady = await _checkPermission();
                      if (_permissionReady) {
                        await _prepareSaveDir();
                        try {
                          await Dio().download(
                              controller.text, _localPath + "/" + type);
                        } catch (e) {
                          print("Download Failed.\n\n" + e.toString());
                        }
                      }
                    },
                    child: Text('Download'))
              ],
            ),
          ),
        );
      },
    );
  }

  _getUrlMimeType(String url) async {
    final response = await http.head(Uri.parse(url));
    return response.headers['content-type'];
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    print(_localPath);
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }
}
