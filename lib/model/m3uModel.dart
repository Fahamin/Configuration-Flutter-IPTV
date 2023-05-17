import 'package:firebase_database/firebase_database.dart';

class DataModel {
  var name;
  var link;

  DataModel({
    this.name,
    this.link,
  });

  DataModel.fromSnapshot(DataSnapshot snapshot) {
    Map<String, dynamic> myData =
        Map<String, dynamic>.from(snapshot.value as Map);
    name = myData["name"].toString() ?? '';
    link = myData["link"].toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "link": link,
    };
  }
}
