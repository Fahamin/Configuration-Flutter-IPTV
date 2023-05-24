import 'package:firebase_database/firebase_database.dart';

class BuildModel {
  var id;
  var link;
  var name;
  var url;

  BuildModel({
    this.id,
    this.link,
    this.name,
    this.url,
  });

  BuildModel.fromSnapshot(DataSnapshot snapshot) {
    Map<String, dynamic> myData =
    Map<String, dynamic>.from(snapshot.value as Map);
    id = myData["id"].toString() ?? '';
    link = myData["link"].toString() ?? '';
    name = myData["name"].toString() ?? '';
    url = myData["url"].toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "link": link,
      "name": name,
      "url": url,
    };
  }
}
