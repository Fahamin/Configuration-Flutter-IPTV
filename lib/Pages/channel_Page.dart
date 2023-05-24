import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:setup_config_wizard/DB/database_Helper.dart';

import '../Reverpod_Provider/provider_Handle.dart';
import '../Route_Manage/routes_Manage.dart';
import '../navigation/drawer_Menu.dart';

class ChannelPage extends StatefulWidget {
  ChannelPage({Key? key}) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  Color _iconColor = Colors.black;
  late int isSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL Channel"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Consumer(
          builder: (context, ref, chile) {
            final channelList = ref.watch(channelListProvider);
            return channelList.when(
                data: (list) {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5),
                      itemCount: list.length,
                      itemBuilder: (BuildContext ctx, index) {
                        isSave = list[index]['fav'];
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.player2,
                                arguments: list[index]['link']),
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: list[index]['logo']
                                                    .toString()
                                                    .isNotEmpty
                                                ? CachedNetworkImage(
                                                    height: 40,
                                                    width: 40,
                                                    imageUrl: list[index]
                                                        ['logo'],
                                                    placeholder: (context,
                                                            url) =>
                                                        new Icon(
                                                            Icons.tv_outlined),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        new Icon(
                                                            Icons.tv_outlined),
                                                  )
                                                : const Icon(
                                                    Icons.tv,
                                                    color: Colors.blue,
                                                  )),
                                        Text(
                                          list[index]["title"],
                                          style: TextStyle(
                                            color: Colors.blue[600],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )),
                                IconButton(
                                  icon: isSave == 1
                                      ? Icon(
                                          Icons.favorite,
                                          color: _iconColor,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: _iconColor,
                                        ),
                                  onPressed: () async {
                                    setState(() async {
                                      if (list[index]['fav'] == 1) {
                                        isSave = 0;
                                        await SQLHelper.updateItem(
                                            list[index]['id'],
                                            list[index]['title'],
                                            list[index]['link'],
                                            list[index]['logo'],
                                            list[index]['cat'],
                                            0);
                                      } else {
                                        isSave = 1;
                                        await SQLHelper.updateItem(
                                            list[index]['id'],
                                            list[index]['title'],
                                            list[index]['link'],
                                            list[index]['logo'],
                                            list[index]['cat'],
                                            1);
                                      }
                                    });

                                    debugPrint("fahim" +
                                        list[index]['fav'].toString());
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                error: (error, str) => Text("Not Found"),
                loading: () => Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        ),
      ),
    );
  }
}
