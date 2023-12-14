import 'dart:async';

import 'package:harca/models/expenseModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static const _databaseName ='ExpenseLocal.db';
  static const _databaseVersion = 3;
  static const table = 'Expense_table';
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnSubtitle = 'subtitle';
  static const columnPrice = 'price';
  static const columnIcon = 'icon';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(),_databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }


  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitle TEXT NOT NULL,
      $columnSubtitle TEXT NOT NULL,
      $columnPrice INTEGER NOT NULL,
      $columnIcon INTEGER NOT NULL
      )
      ''');
  }

  Future<int> insert(ExpenseModel expenseModel) async {
    Database? db = await instance.database;
    if(db == null){
      print('null value');
    }
    return await db!.insert(table,{'title':expenseModel.title,'subtitle':expenseModel.subtitle,'price':expenseModel.price,'icon' :expenseModel.icon});
  }
  Future<int> update(ExpenseModel expenseModel) async {
    Database? db = await instance.database;
    int id = expenseModel.toMap()['id'];
    return await db!.update(table,expenseModel.toMap(),where: '$columnId = ?',whereArgs: [id]);
  }
  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table,where: '$columnId = ?',whereArgs: [id]);
  }
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    if (db == null) {
      return [];
    }
    return await db!.query(table);
  }
  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    if(db == null){
      return 0;
    }
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }
  Future<int?> getTotalPrice() async {
    Database? db = await instance.database;
    if (db == null) {
      return 0;
    }
    return Sqflite.firstIntValue(await db.rawQuery('SELECT SUM($columnPrice) as total FROM $table'));
  }
  Future<List<Map<String, dynamic>>> queryBySubtitle(String subtitle) async {
    Database? db = await instance.database;
    if (db == null) {
      return [];
    }
    return await db.query(table, where: 'subtitle = ?', whereArgs: [subtitle]);
  }
}