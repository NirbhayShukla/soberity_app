import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:soberity_app/database/data.dart';

class DataBaseHelper {

  static DataBaseHelper dbhelper;
  static Database db;

  String table = 'habit';
  String colName = 'name';
  String colCost = 'cost';
  String colMoney = 'money';
  String colQuitdate = 'quitdate';
  String colLastinteraction = 'lastinteraction';
  String colMinabstinenceperiod = 'minabstinenceperiod';
  String colMaxabstinenceperiod = 'maxabstinenceperiod';
  String colPreviousabstinenceperiod = 'previousabstinenceperiod';
  String colResets = 'resets';
  String colSpent = 'spent';

  DataBaseHelper.create();

  factory DataBaseHelper() {
    if (dbhelper == null) {
      dbhelper = DataBaseHelper.create();
    }

    return dbhelper;
  }

Future<Database>  initializedb() async{
Directory directory =await getApplicationDocumentsDirectory();
String path=directory.path+'habits.db';

var habitsDatabase = await openDatabase(path,version:2,onCreate:createDb);
return habitsDatabase;
  }

void createDb(Database db,int newVersion ) async{
  await db.execute('CREATE TABLE $table($colName TEXT, $colCost REAL , $colMoney INTEGER , $colQuitdate TEXT, $colLastinteraction TEXT, $colMinabstinenceperiod INTEGER, $colMaxabstinenceperiod INTEGER, $colPreviousabstinenceperiod INTEGER , $colResets INTEGER, $colSpent REAL )');
}

Future<Database> get database async{

if(db == null){
  db=await initializedb();
}

  return db;
}

Future<List<Map<String,dynamic>>> getMapList() async{
  Database db=await this.database;
  var result = await db.query(table);
  return result;
}

Future<int> insert(Data data) async{
  Database db= await this.database;
  var result = await db.insert(table, data.toMap());
  return result;
}

Future<int> update(Data data) async{
  var db=await this.database;
  var result = await db.update(table, data.toMap(),where:'$colName = ?' ,whereArgs: [data.name]);
  return result;
}

Future<int> delete(String name) async{
  Database db = await this.database;
  int result= await db.rawDelete('DELETE FROM $table WHERE $colName = $name');
  return result;
}

Future<List<Data>> getHabitlist() async{
  var maplist = await getMapList();
  int count = maplist.length;

  List<Data> habitlist = List<Data>();
  for(int i=0;i<count;i++){
    habitlist.add(Data.fromMap(maplist[i]));
  }
  return habitlist;
}

}
