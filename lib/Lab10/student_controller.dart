import 'package:adv_flutter_lab/Lab10/student_services.dart';
import 'package:get/get.dart';
import '../../Lab10/student_model.dart';

class StudentController extends GetxController {
  var stdList = <StudentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  void fetchStudents() async {
    final students = await StudentService.instance.getStudents();
    stdList.assignAll(students);
  }

  void addStudent(StudentModel student) async {
    await StudentService.instance.insertStudent(student);
    fetchStudents();
  }

  void updateStudent(StudentModel student) async {
    await StudentService.instance.updateStudent(student);
    fetchStudents();
  }

  void deleteStudent(int id) async {
    await StudentService.instance.deleteStudent(id);
    fetchStudents();
  }
}
