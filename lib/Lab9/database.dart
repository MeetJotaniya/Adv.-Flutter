import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqLiteDatabase {
  static final SqLiteDatabase instance = SqLiteDatabase._init();
  static Database? _database;

  SqLiteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("Student.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
       path,
       version: 1,
       onCreate: _createDB,
     );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Student (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        enrollment_number TEXT NOT NULL,
        grade_12th REAL,
        diploma_cgpa REAL,
        current_cgpa REAL,
        email TEXT,
        phone TEXT,
        city TEXT 
      )
    ''');
  }
}
