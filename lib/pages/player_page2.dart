import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../DB/sqfliteHelper.dart';
import '../ProviderHandaler/ProviderHandle.dart';
import '../navigation/nav_Drawer.dart';

class PlayerPage2 extends StatefulWidget {
  PlayerPage2({Key? key}) : super(key: key);

  @override
  State<PlayerPage2> createState() => _PlayerPageState2();
}

class _PlayerPageState2 extends State<PlayerPage2> {
  late BetterPlayerController _betterPlayerController = BetterPlayerController(
    const BetterPlayerConfiguration(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, Get.arguments);
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
    setState(() {
      _betterPlayerController.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: BetterPlayer(
                            controller: _betterPlayerController,
                          ),
                        )),
                  ],
                ),
                DView.spaceHeight(),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final listProvider = ref.watch(channelListProvider);
                      return listProvider.when(
                          error: (str, error) => Text('Not Found'),
                          loading: () =>
                              Center(child: CircularProgressIndicator()),
                          data: (list) {
                            return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 5),
                                itemCount: list.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: InkWell(
                                      onTap: () {
                                        _betterPlayerController.dispose();
                                        BetterPlayerDataSource
                                            betterPlayerDataSource =
                                            BetterPlayerDataSource(
                                                BetterPlayerDataSourceType
                                                    .network,
                                                list[index]['link']);
                                        _betterPlayerController =
                                            BetterPlayerController(
                                                const BetterPlayerConfiguration(),
                                                betterPlayerDataSource:
                                                    betterPlayerDataSource);
                                        setState(() {
                                          _betterPlayerController.play();
                                        });
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
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
                                                          imageUrl: list[index]
                                                              ['logo'],
                                                          placeholder: (context,
                                                                  url) =>
                                                              new Icon(Icons
                                                                  .tv_outlined),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              new Icon(Icons
                                                                  .tv_outlined),
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
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
// future builder get data then show view
FutureBuilder(
future: SQLHelper.getChannelByCategory(Get.arguments),
builder: (context, snapshot) {
return snapshot.hasData
? ListView.builder(
itemCount: snapshot.data?.length,
itemBuilder: (_, int position) {
return Card(
child: ListTile(
title: Text(snapshot.data?[position]['title']),
),
);
},
)
    : Center(child: CircularProgressIndicator(),);
},
),
*/
