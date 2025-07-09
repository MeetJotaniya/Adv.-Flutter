import 'package:adv_flutter_lab/Lab9/student_uni_crud/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StudentDB {
  static final StudentDB instance = StudentDB._init();
  static Database? _database;
  StudentDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('student.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE student (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        enrollmentNo TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertStudent(StudentModel student) async {
    final db = await instance.database;
    return await db.insert('student', student.toMap());
  }

  Future<List<StudentModel>> getStudents() async {
    final db = await instance.database;
    final result = await db.query('student');
    return result.map((json) => StudentModel.fromMap(json)).toList();
  }

  Future<int> updateStudent(StudentModel student) async {
    final db = await instance.database;
    return db.update('student', student.toMap(),
        where: 'id = ?', whereArgs: [student.id]);
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return await db.delete('student', where: 'id = ?', whereArgs: [id]);
  }
}