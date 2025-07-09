import 'package:adv_flutter_lab/Lab9/db_controller.dart';
import 'package:adv_flutter_lab/Lab9/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DbView extends StatelessWidget {
  final DbController controller = Get.put(DbController());

  DbView({super.key});

  void addSample() {
    final student = DbModel(name: "Meet", enrollmentNo: "23010101116", currentCgpa: 8.57, email: "23010101116@darshan.ac.in", city: "Morbi", phoneNo: "8141746072");
    controller.addStudent(student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DataBase View")),
      body: Obx(() {
        if (controller.studentList.isEmpty) {
          return Center(
            child: Text(
              "No students found. Please add some.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) {
            final student = controller.studentList[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('${student.city} | CGPA: ${student.currentCgpa}'),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addSample,
        child: const Icon(Icons.add),
      ),
    );
  }
}