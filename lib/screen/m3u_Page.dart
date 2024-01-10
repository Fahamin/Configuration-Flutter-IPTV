import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'dart:convert' as convert;
import 'package:m3u_parser_nullsafe/m3u_parser_nullsafe.dart';
import 'package:http/http.dart' as http;

import '../model/m3u_Model.dart';
import '../DB/database_Helper.dart';
import '../navigation/drawer_Menu.dart';
import '../routes/routes.dart';

class M3uPage extends StatelessWidget {
  M3uPage({Key? key}) : super(key: key);

  final dataBaseRef = FirebaseDatabase.instance.ref("mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("M3U List"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: FirebaseAnimatedList(
        scrollDirection: Axis.vertical,
        query: dataBaseRef,
        itemBuilder: (context, DataSnapshot spons, Animation<double> animation,
            int index) {
          DataModel model = DataModel.fromSnapshot(spons);
          if (model.name == null) {
            return CircularProgressIndicator(
              backgroundColor: Colors.green,
            );
          } else {
            return ListTile(
              onTap: () async {
                _createPlayList(model.name.toString(), model.link.toString());
              },
              leading: Icon(Icons.tv),
              title: Text(model.name.toString()),
            );
          }
        },
      ),
    );
  }
}

Future<void> _createPlayList(String name, String link) async {
  /* final m3uList = await M3uList.loadFromFile('resources/example.m3u');
  for (var item in m3uList.items) {
    print('Title: ${item.title}');
  }*/

  var data = await SQLHelper.checkPlayList(name);

  if (data.isEmpty) {
    var m3u;
    final response = await http.get(Uri.parse(link));
    m3u = await M3uList.load(response.body);

    await SQLHelper.createPlayList(name);

    for (var entry in m3u.items) {
      _addChannel(
          entry.title, entry.link, entry.attributes["tvg-logo"], name, 0);
    }

  }
  Get.toNamed(Routes.player, arguments: name);
}

// Insert a new item to the database
Future<void> _addChannel(
    String _title, String _link, String? _logo, String cat, int fav) async {
  await SQLHelper.AddChannel(_title, _link, _logo, cat, fav);
}
