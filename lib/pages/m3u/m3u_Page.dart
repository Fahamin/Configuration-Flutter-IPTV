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

import '../../model/m3uModel.dart';
import '../../DB/sqfliteHelper.dart';
import '../../navigation/nav_Drawer.dart';

class M3uPage extends StatefulWidget {
  const M3uPage({Key? key}) : super(key: key);

  @override
  State<M3uPage> createState() => _M3uPageState();
}

class _M3uPageState extends State<M3uPage> {
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
              onTap: () =>
                  _createPlayList(model.name.toString(), model.link.toString()),
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
  var m3u;
  final response = await http.get(Uri.parse(link));
  log('movieTitle: $response');
  m3u = await M3uList.load(response.body);
  for (var entry in m3u.items) {
    log('movieTitle:${entry.title}');
    _addItem(entry.title, entry.link, entry.attributes["tvg-logo"], name);
  }
  await SQLHelper.createPlayList(name);
}

// Insert a new item to the database
Future<void> _addItem(
    String _title, String _link, String? _logo, String cat) async {
  await SQLHelper.createItem(_title, _link, _logo, cat);
  log('movieTitle:${SQLHelper.getAllPlayList()}');
}
