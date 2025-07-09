import 'package:adv_flutter_lab/Lab9/student_uni_crud/string_constants.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/student_add_edit.dart';
import 'package:adv_flutter_lab/Lab9/student_uni_crud/student_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentView extends StatelessWidget {
  StudentView({super.key});
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student View"),
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder<StudentController>(
          init: studentController,
          builder: (studentController){
            return studentController.studentlist.isEmpty ?
            Center(child: Text("No student found"),) :
                ListView.builder(
                  itemCount: studentController.studentlist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(onPressed: () {
                                final deleteindex = studentController.studentlist[index][COL_STUDENT_ID];
                                studentController.deletestudentToTbl(deleteindex);
                              }, icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                        title: Text(studentController.studentlist[index]['studentName']),
                        subtitle: Text(studentController.studentlist[index]['universityName']),
                      ),
                    );
                },);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(StudentAddEdit());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
