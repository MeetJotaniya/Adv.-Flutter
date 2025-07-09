import 'package:adv_flutter_lab/Lab10/student_controller.dart';
import 'package:adv_flutter_lab/Lab10/student_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StdView extends StatelessWidget {
  final StudentController controller = Get.put(StudentController());

  final nameController = TextEditingController();
  final enrollController = TextEditingController();
  final updateMode = false.obs;
  final selectedId = RxnInt();

  void clearInputs() {
    nameController.clear();
    enrollController.clear();
    updateMode.value = false;
    selectedId.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student View",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: enrollController,
              decoration: InputDecoration(labelText: 'Enrollment No.'),
            ),
            SizedBox(height: 10),
            Obx(() => Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        enrollController.text.isNotEmpty) {
                      if (updateMode.value && selectedId.value != null) {
                        controller.updateStudent(StudentModel(
                          id: selectedId.value,
                          name: nameController.text,
                          enrollmentNo: enrollController.text,
                        ));
                      } else {
                        controller.addStudent(StudentModel(
                          name: nameController.text,
                          enrollmentNo: enrollController.text,
                        ));
                      }
                      clearInputs();
                    }
                  },
                  child: Text(updateMode.value ? 'Update' : 'Add'),
                ),
                SizedBox(width: 10),
                if (updateMode.value)
                  ElevatedButton(
                    onPressed: clearInputs,
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
              ],
            )),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.stdList.length,
                itemBuilder: (context, index) {
                  final student = controller.stdList[index];
                  return Card(
                    child: ListTile(
                      title: Text(student.name),
                      subtitle: Text("Enrollment: ${student.enrollmentNo}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              nameController.text = student.name;
                              enrollController.text = student.enrollmentNo;
                              updateMode.value = true;
                              selectedId.value = student.id;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteStudent(student.id!);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
