

import 'package:adv_flutter_lab/Lab9/student_uni_crud/db_service.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/string_constants.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/university_model.dart';
import 'package:sqflite/sqflite.dart';

class Repository{
  DatabaseService? dbService;
  Repository(this.dbService);

  Future<List<Map<String , dynamic>>> getAll() async{
    final db = await dbService!.database;

    return await db.rawQuery('''
      SELECT S.$COL_STUDENT_ID,
        S.$COL_STUDENT_NAME,
        S.$COL_STUDENT_ENROLLMENT,
        S.$COL_GRADE12,
        S.$COL_CGPA,
        U.$COL_UNI_NAME AS UNIVERSITY_NAME
        FROM $TBL_STUDENT S JOIN $TBL_UNIVERSITY U
        ON S.$COL_UNIVERSITY_ID = U.$COL_UNI_ID 
    ''');
  }

  Future<int> addUniversity(String name) async{
      Database db = await dbService!.database;
      return await db.insert(TBL_UNIVERSITY , UniversityModel(universityName: name).toMap());
  }
  
  Future<int> addUser(Map<String , dynamic> student) async{
    Database db = await dbService!.database;
    return await db.insert(TBL_STUDENT, student);
  }

  Future<void> deleteStudent(String tableName , int studentId) async{
    Database db = await dbService!.database;
    await db.delete(tableName , where: "$COL_STUDENT_ID" , whereArgs: [studentId]);
  }
}