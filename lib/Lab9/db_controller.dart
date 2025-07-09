import 'package:adv_flutter_lab/Lab9/database.dart';
import 'package:adv_flutter_lab/Lab9/db_model.dart';
import 'package:get/get.dart';

class DbController extends GetxController{
  var studentList = <DbModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStudents();
  }

  Future<void> loadStudents() async{
    final db = await SqLiteDatabase.instance.database;
    final result = await db.query("Student");
    studentList.value = 
        result.map((json) => DbModel.fromMap(json)).toList();
  }

  Future<void> addStudent(DbModel student)async{
    final db = await SqLiteDatabase.instance.database;
    await db.insert("Student", student.toMap());
    loadStudents();
  }
}
