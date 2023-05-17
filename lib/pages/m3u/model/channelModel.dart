

import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class ChannelModel {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String logo;

  @HiveField(2)
  late String link;

  ChannelModel(this.title, this.logo, this.link);
}
