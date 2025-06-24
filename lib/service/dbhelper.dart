import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'minecraft_user.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE user_profile (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        photo TEXT
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(
    'user_profile',
    user,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  }


  Future<Map<String, dynamic>?> getUser() async {
    final db = await database;
    final result = await db.query('user_profile', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update('user_profile', user, where: 'id = ?', whereArgs: [user['id']]);
  }

  Future<int> deleteUser() async {
    final db = await database;
    return await db.delete('user_profile');
  }

  
}
