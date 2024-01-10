import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../DB/database_Helper.dart';
import '../navigation/drawer_Menu.dart';
import '../providers/provider_riverpod.dart';

class PlayerPage extends ConsumerStatefulWidget {
  PlayerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends ConsumerState<PlayerPage> {
  late BetterPlayerController _betterPlayerController = BetterPlayerController(
    const BetterPlayerConfiguration(),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(),
    );
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
    Color _iconColor = Colors.black;
    final channelList =
    ref.watch(channelCategoryListProvider(Get.arguments));
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
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: CupertinoSearchTextField(
                    enabled: true,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ] ),
                    onChanged: (value) => ref
                        .read(searchQueryProvider.notifier)
                        .update((state) => state = value),
                    itemColor: Colors.black,
                    itemSize: 28,
                    prefixInsets: const EdgeInsets.only(left: 15),
                    suffixInsets: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.all(14),
                    placeholder: "Search Channel ",
                    suffixMode: OverlayVisibilityMode.always,
                  ),
                ),
                Expanded(child: Consumer(builder: (context, ref, child) {
                  final searchQuery =
                  ref.watch(searchQueryProvider).toLowerCase();

                  return channelList.when(
                      data: (list) {
                        final filteredData = list
                            .where((item) => item.title
                            .toString()
                            .toLowerCase()
                            .contains(searchQuery))
                            .toList();
                        return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 5),
                            itemCount: filteredData.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final model = filteredData.elementAt(index);
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: InkWell(
                                  onTap: () {
                                    _betterPlayerController.dispose();
                                    BetterPlayerDataSource
                                    betterPlayerDataSource =
                                    BetterPlayerDataSource(
                                        BetterPlayerDataSourceType.network,
                                        model.link!);
                                    _betterPlayerController =
                                        BetterPlayerController(
                                            const BetterPlayerConfiguration(),
                                            betterPlayerDataSource:
                                            betterPlayerDataSource);
                                    setState(() {
                                      _betterPlayerController.play();
                                    });
                                  },
                                  child: Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      Container(
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
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: model.logo!.isNotEmpty
                                                      ? CachedNetworkImage(
                                                    height: 40,
                                                    width: 40,
                                                    imageUrl: model.logo
                                                        .toString(),
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
                                                model.title!,
                                                style: TextStyle(
                                                  color: Colors.blue[600],
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          )),
                                      IconButton(
                                        icon: model.fav==1
                                            ? Icon(
                                          Icons.favorite,
                                          color: _iconColor,
                                        )
                                            : Icon(
                                          Icons.favorite_border,
                                          color: _iconColor,
                                        ),
                                        onPressed: () async {
                                          model.fav==1
                                              ? await SQLHelper.updateItem(
                                              model.id!,
                                              model.title!,
                                              model.link!,
                                              model.logo!,
                                              model.cat!,
                                              0)
                                              : await SQLHelper.updateItem(
                                              model.id!,
                                              model.title!,
                                              model.link!,
                                              model.logo!,
                                              model.cat!,
                                              1);

                                          ref.refresh(channelListProvider);
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
                })),
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
