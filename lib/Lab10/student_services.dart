import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Lab10/student_model.dart';

class StudentService {
  static final StudentService instance = StudentService._init();
  static Database? _database;

  StudentService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('student.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE students (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            enrollmentNo TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertStudent(StudentModel student) async {
    final db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<List<StudentModel>> getStudents() async {
    final db = await instance.database;
    final result = await db.query('students');
    return result.map((map) => StudentModel.fromMap(map)).toList();
  }

  Future<int> updateStudent(StudentModel student) async {
    final db = await instance.database;
    return await db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return await db.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
