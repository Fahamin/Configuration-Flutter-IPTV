import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setup_config_wizard/model/buildModel.dart';
import 'package:setup_config_wizard/pages/build/custom_listtile.dart';

import '../../model/m3uModel.dart';

class BuildPage extends StatefulWidget {
  const BuildPage({Key? key}) : super(key: key);

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  final dataBaseRef = FirebaseDatabase.instance.ref("builds");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build List"),
        centerTitle: true,
      ),
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
