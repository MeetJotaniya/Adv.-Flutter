import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseModel {
  final int? uid;
  final String name;
  final String city;
  final String gender;

  DatabaseModel({
    this.uid,
    required this.name,
    required this.city,
    required this.gender,
  });

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE TBL_USER(
            uid INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            city TEXT NOT NULL,
            gender TEXT NOT NULL
          )
        ''');
      },
    );
  }

  static Future<void> insert(DatabaseModel user) async {
    final db = await database;
    await db.insert('TBL_USER', {
      'name': user.name,
      'city': user.city,
      'gender': user.gender,
    });
  }

  static Future<List<DatabaseModel>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('TBL_USER');

    return List.generate(maps.length, (i) {
      return DatabaseModel(
        uid: maps[i]['uid'],
        name: maps[i]['name'],
        city: maps[i]['city'],
        gender: maps[i]['gender'],
      );
    });
  }

  static Future<void> update(DatabaseModel user) async {
    final db = await database;
    await db.update(
      'TBL_USER',
      {
        'name': user.name,
        'city': user.city,
        'gender': user.gender,
      },
      where: 'uid = ?',
      whereArgs: [user.uid],
    );
  }

  static Future<void> delete(int uid) async {
    final db = await database;
    await db.delete(
      'TBL_USER',
      where: 'uid = ?',
      whereArgs: [uid],
    );
  }
}
