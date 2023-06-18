import 'dart:async';
import 'package:my_sfu/models/Prikaz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperPrikaz {
  static final DatabaseHelperPrikaz instance = DatabaseHelperPrikaz._();

  static Database? _database;

  DatabaseHelperPrikaz._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'cachePrikazV2.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
  CREATE TABLE prikazy1 (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nomer TEXT,
    title TEXT,
    date TEXT,
    id_student INTEGER,
    liniyaGizni INTEGER
  )
''');
  }

  Future<void> savePrikaz(Prikaz prikaz) async {
    final db = await instance.database;
    await db.insert('prikazy1', prikaz.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Prikaz>> getPrikaz() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('prikazy1');
    return List.generate(maps.length, (index) {
      return Prikaz.fromMap(maps[index]);
    });
  }

  Future<void> deleteAllRows() async {
    final db = await instance.database;
    await db.delete('prikazy1');
  }
}