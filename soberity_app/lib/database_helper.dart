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

var habitsDatabase = await openDatabase(path,version:1,onCreate:createDb);
return habitsDatabase;
  }

void createDb(Database db,int newVersion ) async{
  await db.execute('CREATE TABLE habits(colname TEXT,colcost REAL ,colmoney INTEGER , collastinteraction BLOB,colquitdate BLOB,colmaxabstinenceperiod BLOB,colminabstinenceperiod BLOB,colpreviousabstinenceperiod BLOB ,colspent REAL ,colresets INTEGER) ');
}

Future<Database> get database async{

if(db == null){
  db=await initializedb();
}

  return db;
}

Future<List<Map<String,dynamic>>> getMapList() async{
  Database db=await this.database;
  var result = await db.query('habits');
  return result;
}

Future<int> insert(Data data) async{
  Database db= await this.database;
  var result = await db.insert('habits', data.toMap());
  return result;
}

Future<int> update(Data data) async{
  var db=await this.database;
  var result = await db.update('habits', data.toMap(),where:'colname = ?' ,whereArgs: [data.name]);
  return result;
}

Future<int> delete(String name) async{
  Database db = await this.database;
  int result= await db.delete('habits',where:'colname = ?',whereArgs:[name]);
  return result;
}

}
