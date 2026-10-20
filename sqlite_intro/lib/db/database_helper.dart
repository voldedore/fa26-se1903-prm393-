import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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

  // Update


  // Delete
}