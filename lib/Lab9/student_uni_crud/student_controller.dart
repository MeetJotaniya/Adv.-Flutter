import 'package:adv_flutter_lab/Lab9/student_uni_crud/my_database.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/repo.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/string_constants.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  RxList<Map<String, dynamic>> studentlist = <Map<String, dynamic>>[].obs;
  var nameController = TextEditingController();
  var enrollController = TextEditingController();
  var grade12Controller = TextEditingController();
  var cgpaController = TextEditingController();
  var emailController = TextEditingController();
  var cityController = TextEditingController();
  var universityController = TextEditingController();
  Repository userRepository = Repository(MyDatabase());

  @override
  void onInit() {
    super.onInit();
    fetchStudent();
  }

  Future<void> fetchStudent() async {
    final data = await userRepository.getAll();
    studentlist.addAll(data);
    update();
  }

  Future<void> addstudentToTbl(StudentModel student) async {
    userRepository.addUser(student.toMap());
    fetchStudent();
    clear();
    Get.back();
  }

  Future<void> deletestudentToTbl(int id) async {
    userRepository.deleteStudent(TBL_STUDENT, id);
    fetchStudent();
  }

  Future<int> adduniversityToTbl(String name) async {
    return userRepository.addUniversity(name);
  }

  void clear() {
    nameController.clear();
    enrollController.clear();
    grade12Controller.clear();
    cgpaController.clear();
  }
}