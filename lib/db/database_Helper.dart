import 'dart:convert';

import 'package:setup_config_wizard/model/channel_Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static final DATABASE_NAME = "databaseTV";
  static final VERSTION = 1;
  static final CHANNEL_TABLE = "channelTable";

  static final ID = "id";
  static final TITLE = "title";
  static final LINK = "link";
  static final LOGO = "logo";
  static final CAT = "cat";
  static final CTIME = "createdAt";
  static final FAV = "fav";

  //FOR TWO
  static final PLAYLIST_TABLE = "playListTable";
  static final COLT_1 = "id";
  static final COLT_2 = "title";

  static Future<void> createTables(sql.Database database) async {
    String CREATE_TABLE_QUERY = "CREATE TABLE " +
        CHANNEL_TABLE +
        "(" +
        ID +
        " INTEGER PRIMARY KEY AUTOINCREMENT ," +
        TITLE +
        " TEXT," +
        LINK +
        " TEXT," +
        LOGO +
        " TEXT," +
        CAT +
        " TEXT," +
        CTIME +
        " TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP," +
        FAV +
        " BIT " +
        ")";

    String CREATE_TABLE2_QUERY = "CREATE TABLE " +
        PLAYLIST_TABLE +
        "(" +
        COLT_1 +
        " INTEGER PRIMARY KEY AUTOINCREMENT ," +
        COLT_2 +
        " TEXT" +
        ")";

    await database.execute(CREATE_TABLE_QUERY);
    await database.execute(CREATE_TABLE2_QUERY);

    /* await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);*/
  }

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    var databasesPath = await getDatabasesPath();
    return await sql.openDatabase(
      DATABASE_NAME,
      version: VERSTION,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> AddChannel(
      String title, String link, String? logo, String cat, int fav) async {
    final db = await SQLHelper.db();

    final data = {TITLE: title, LINK: link, LOGO: logo, CAT: cat, FAV: fav};
    final id = await db.insert(CHANNEL_TABLE, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  List<ChannelModel> channelList = [];

  // Read all items (journals)
  Future<List<ChannelModel>> getAllChannel() async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> maps =
        await db.query(CHANNEL_TABLE, orderBy: "id");

    return List<ChannelModel>.from(maps.map((map) => ChannelModel.fromMap(map)));


  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItemByID(int id) async {
    final db = await SQLHelper.db();
    return db.query(CHANNEL_TABLE, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<ChannelModel>> getChannelByCategory(
      String cat) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> maps = await db.query(CHANNEL_TABLE, where: "cat = ?", whereArgs: [cat]);

    return List<ChannelModel>.from(maps.map((map) => ChannelModel.fromMap(map)));

  }

  static Future<List<Map<String, dynamic>>> getChannelFavList(
      String cat) async {
    final db = await SQLHelper.db();
    return db.query(CHANNEL_TABLE, where: "fav = ?", whereArgs: [cat]);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String title, String link, String logo,
      String cat, int fav) async {
    final db = await SQLHelper.db();

    final data = {
      TITLE: title,
      LINK: link,
      LOGO: logo,
      CAT: cat,
      CTIME: DateTime.now().toString(),
      FAV: fav
    };

    final result =
        await db.update(CHANNEL_TABLE, data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete(CHANNEL_TABLE, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }

  // Create new item (journal)
  static Future<int> createPlayList(String title) async {
    final db = await SQLHelper.db();
    final data = {COLT_2: title};
    final id = await db.insert(PLAYLIST_TABLE, data);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getAllPlayList() async {
    final db = await SQLHelper.db();
    return db.query(PLAYLIST_TABLE, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> checkPlayList(String id) async {
    final db = await SQLHelper.db();
    return db.query(PLAYLIST_TABLE, where: "title = ?", whereArgs: [id]);
  }
}
