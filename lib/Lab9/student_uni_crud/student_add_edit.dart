import 'package:adv_flutter_lab/Lab9/student_uni_crud/student_controller.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentAddEdit extends StatelessWidget {
  StudentAddEdit({super.key});

  final StudentController studentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
          children: [
            TextField(
              controller: studentController.nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: studentController.enrollController,
              decoration: InputDecoration(labelText: "Enrollment No"),
            ), TextField(
              controller: studentController.grade12Controller,
              decoration: InputDecoration(labelText: "12th Grade"),
            ),
            TextField(
              controller: studentController.cgpaController,
              decoration: InputDecoration(labelText: "Diploma CGPA"),
            ),
            TextField(
              controller: studentController.universityController,
              decoration: InputDecoration(labelText: "University Name"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async {
              int uniId = await studentController.adduniversityToTbl(studentController.universityController.text);

              final student = StudentModel(
                name: studentController.nameController.text,
                enrollment: studentController.enrollController.text,
                grade12: studentController.grade12Controller.text,
                universityId: uniId,
                diplomaCGPA: studentController.cgpaController.text
              );

              studentController.addstudentToTbl(student);
            }, child: Text("Add"))
        ],
      ),
      ),
    );
  }
}
