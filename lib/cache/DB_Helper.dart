import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Zachetka.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'cacheLastOff.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE zachetka(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        yearOfStudy INTEGER,
        semester INTEGER,
        discipline TEXT,
        controlType TEXT,
        finalGrade TEXT,
        liniyaGizni INTEGER,
        countCource INTEGER,
        idStudent INTEGER
      )
    ''');
  }

  Future<void> saveZachetka(Zachetka zachetka) async {
    final db = await instance.database;
    await db.insert('zachetka', zachetka.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Zachetka>> getZachetki() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('zachetka');
    return List.generate(maps.length, (index) {
      return Zachetka.fromMap(maps[index]);
    });
  }

  Future<void> deleteAllRows() async {
    final db = await instance.database;
    await db.delete('zachetka');
  }
}