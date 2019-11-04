import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import './data.dart';

class DataBaseHelper {
  static DataBaseHelper dbhelper;
  static Database db;

  String name = 'name';
  String cost = 'cost';
  String money = 'money';
  String quitdate = 'quitdate';
  String lastinteraction = 'lastinteraction';
  String minabstinenceperiod = 'minabstinenceperiod';
  String maxabstinenceperiod = 'maxabstinenceperiod';
  String previousabstinenceperiod = 'previousabstinenceperiod';
  String resets = 'resets';
  String spent = 'spent';

  DataBaseHelper.create();

  factory DataBaseHelper() {
    if (dbhelper == null) {
      dbhelper = DataBaseHelper.create();
    }

    return dbhelper;
  }

Future<Database>  initializedb() async{
Directory directory =await getApplicationDocumentsDirectory();
String path=directory.path+'notes.db';

var notesDatabase = await openDatabase(path,version:1,onCreate:createDb);
return notesDatabase;
  }

void createDb(Database db,int newVersion ) async{
  await db.execute(' ';)
}

Future<Database> get database async{

if(db == null){
  db=await initializedb();
}

  return db;
}

Future<List<Map<String,dynamic>>> getMapList() async{
  Database db=await this.database;
  var result = await db.query();
  return result;
}

Future<int> insert(Data data) async{
  Database db= await this.database;
  var result = await db.insert(table, data.toMap());
  return result;
}

Future<int> update(Data data) async{
  var db=await this.database;
  var result = await db.update(table, data.toMap(),where: );
  return result;
}

Future<int> delete(Data data) async{
  Database db = await this.database;
  int result= await db.rawDelete(sql);
  return result;
}

}
