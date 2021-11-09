// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables

import 'package:sqflite/sqflite.dart';

late Database database;
List<Map> datas = [];

abstract class Sqflite {
  static void createDatabase() async {
    database = await openDatabase('reacount.db', version: 1,
        onCreate: (database, version) async {
      await database.execute(
          'CREATE TABLE data (id INTEGER PRIMARY KEY,name TEXT,count REAL,type TEXT)');
      await database.execute(
          'CREATE TABLE details(detailsid INTEGER PRIMARY KEY,id INTEGER,count REAL,description TEXT,type TEXT,time TEXT,date TEXT)');
    }, onOpen: (database) {
      getDataBaseData().then((value) {
        datas = value;
      });
    });
  }

  static Future<int> insertToDataBaseData(name, type) async {
    int id = await database.rawInsert(
        'INSERT INTO details(name,count,type) VALUES("$name",0,"$type")');
    return id;
  }

  static Future<void> insertToDataBaseDetail(
      id, count, description, type, time, date) {
    return database.rawInsert(
        'INSERT INTO data(id,count,description,type,time,date) VALUES($id,$count,"$description","$type","$time","$date")');
  }

  static Future<List<Map>> getDataBaseData() async {
    List<Map> list = await database.rawQuery('SELECT * FROM data');
    return list;
  }

  static Future<List<Map>> getDataBaseDetail(id) async {
    List<Map> list =
        await database.rawQuery('SELECT * FROM details WHERE id EQUAL $id');
    return list;
  }

  static Future<void> deleteData(id) async {
    await database.execute('DELETE * FROM data WHERE id EQUAL $id');
    await database.execute('DELETE * FROM details WHERE id EQUAL $id');
  }

  static Future<void> deleteDetail(detailsid) async {
    await database
        .rawDelete('DELETE * FROM details WHERE detailsid = ?', ['$detailsid']);
  }

  static Future<void> editData({id, name, type}) async {
    await database.rawUpdate(
        'UPDATE data SET name = ?, type = ? WHERE id = $id', ['$name,$type']);
  }

  static Future<void> editCount(id, count) async {
    await database.rawUpdate('UPDATE data SET count = ?', [count]);
  }
}
