import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../model/buildModel.dart';
import '../navigation/nav_Drawer.dart';
import 'build/custom_listtile.dart';

class NexusAddons extends StatelessWidget {
  NexusAddons({Key? key}) : super(key: key);
  final dataBaseRef = FirebaseDatabase.instance.ref("matrix");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nexus Addons"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: FirebaseAnimatedList(
        scrollDirection: Axis.vertical,
        query: dataBaseRef,
        itemBuilder: (context, DataSnapshot spons, Animation<double> animation,
            int index) {
          BuildModel model = BuildModel.fromSnapshot(spons);
          if (model.name == null) {
            return CircularProgressIndicator(
              backgroundColor: Colors.green,
            );
          } else {
            return BuildItemDesign(model.name, model.link, model.url);
          }
        },
      ),
    );
  }
}
