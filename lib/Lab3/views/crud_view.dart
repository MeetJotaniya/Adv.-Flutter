import 'package:adv_flutter_lab/Lab2/model/user_model.dart';
import 'package:adv_flutter_lab/Lab3/controller/crud_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CrudView()));
}

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {
  TextEditingController nameController = TextEditingController();
  UserCrudController _userController = UserCrudController();

  late UserModel temp;

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Crud")),

      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "enter Your Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (isEdit) {
                  _userController.editUser(
                    temp,
                    UserModel(name: nameController.text.toString()),
                  );
                  isEdit = false;
                } else {
                  _userController.addUser(
                    UserModel(name: nameController.text.toString()),
                  );
                }
                nameController.clear();

                setState(() {});
              },
              child: Text(isEdit ? "Edit" : "Add"),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: _userController.getUser.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("${_userController.getUser[index].name}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _userController.deleteUser(
                              _userController.getUser[index],
                            );

                            setState(() {});
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),

                        IconButton(
                          onPressed: () {
                            temp = _userController.getUser[index];
                            isEdit = true;
                            nameController.text = temp.name!;
                            setState(() {});
                          },
                          icon: Icon(Icons.edit, color: Colors.blue),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}