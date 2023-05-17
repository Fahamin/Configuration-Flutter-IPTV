import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import '../../model/m3uModel.dart';
class DatabaseService {


  static Future<List<dynamic>> getUsers() async {
    final List<DataModel> list = [];

    final snapshot = await FirebaseDatabase.instance.ref('mm').get();

    final map = snapshot.value as Map;

    map.forEach((key, value) {
      final user = DataModel.fromSnapshot(value);
      list.add(user);
      debugPrint("dd"+user.toString());
    });
    return list;
  }

 /* static Future<List<dynamic>> getData() async {

    final snapshot = await FirebaseDatabase.instance
        .ref("mm")
        .orderByKey()
        .get();

    //  print(snapshot); // to debug and see if data is returned

    List<DataModel> needs = [];

    Map<dynamic, dynamic> values = snapshot.data.value;
    values.forEach((key, values) {
      needs.add(Need.fromSnapshot(values));
    });

    return needs;
  }*/
}