import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:setup_config_wizard/ProviderHandaler/ProviderHandle.dart';
import 'package:setup_config_wizard/RouteManage/routesall.dart';

import '../navigation/nav_Drawer.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

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
                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                            onTap: () => Get.toNamed(Routes.player2,
                                arguments: list[index]['link']),
                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: list[index]['logo']
                                                .toString()
                                                .isNotEmpty
                                            ? CachedNetworkImage(
                                                height: 50,
                                                width: 50,
                                                imageUrl: list[index]['logo'],
                                                placeholder: (context, url) =>
                                                    new Icon(Icons.tv_outlined),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    new Icon(Icons.tv_outlined),
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
