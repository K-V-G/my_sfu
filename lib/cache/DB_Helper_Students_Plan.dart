import 'dart:async';
import 'package:my_sfu/models/StudentsPlan.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelperStudentsPlan {
  static final DatabaseHelperStudentsPlan instance = DatabaseHelperStudentsPlan._();

  static Database? _database;

  DatabaseHelperStudentsPlan._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'cacheStudentsPlan.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE studentsPlan(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idStudentsPlan INTEGER,
        title TEXT,
        department TEXT,
        totalSelfWorkHours INTEGER,
        totalLectureHours INTEGER,
        totalPracticeHours INTEGER,
        hasExam INTEGER,
        hasPass INTEGER,
        yearOfStudy INTEGER,
        semestr INTEGER,
        count_c INTEGER,
        liniyaGizni INTEGER,
        id_student INTEGER,
        obyzatOrNeObyzat INTEGER
      )
    ''');
    print("Hello FROM DB 2");
  }

  Future<void> saveStudentsPlan(StudentsPlan studentsPlan) async {
    final db = await instance.database;
    await db.insert('studentsPlan', studentsPlan.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<StudentsPlan>> getStudentsPlan() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('studentsPlan');

    return List.generate(maps.length, (index) {
      return StudentsPlan.fromMap(maps[index]);
    });
  }

  Future<void> deleteAllRows() async {
    final db = await instance.database;
    await db.delete('studentsPlan');
  }
}