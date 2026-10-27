import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../model/note.dart';

class DatabaseHelper {
  static const _databaseName = 'se1903_notemanagement.db';
  static const _noteTableName = 'notes';

  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // getter
  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }
  /*
  * Syntax ??=
  * a ??= b
  * a = a ?? b
  */

  Future<Database> _initDatabase() async {
    // Danh cho web
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb; // Chuyen qua factory khac khi dung web
      return openDatabase(_databaseName, version: 1, onCreate: _onCreate);
    }
    // Danh cho app
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_noteTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');
  }

  // ----- GET LIST ----
  Future<List<Note>> getAll() async {
      final db = await database;
      final List<Map<String, Object?>> maps = await db.query(
        _noteTableName,
        orderBy: 'id DESC'
      );

      return [for (final map in maps) Note.fromJson(map)];
  }

  // Create
  Future<int> insert(Note note) async {
    final db = await database;
    return db.insert(_noteTableName, note.toJson());
  }


  // Update


  // Delete
  Future<int> delete(int id) async {
    final db = await database;
    return db.delete(_noteTableName, where: 'id = ?', whereArgs: [id]);
  }
}