import 'package:flutter/material.dart';
import '../controller/profile_card_controller.dart';
import '../controller/user_controller.dart';
import 'user_view.dart';

class ProfileCardView extends StatefulWidget {
  const ProfileCardView({super.key});

  @override
  State<ProfileCardView> createState() => _ProfileCardViewState();
}

class _ProfileCardViewState extends State<ProfileCardView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final ProfileCardController _profileCardController = ProfileCardController();
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Card Input Form",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: _profileCardController.validateName,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                validator: _profileCardController.validateEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: numberController,
                validator: _profileCardController.validateNumber,
                decoration: InputDecoration(
                  labelText: "Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _userController.setDetails(
                      nameController.text,
                      emailController.text,
                      numberController.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserView()),
                    );
                  }
                },
                child: Text("Create Profile Card"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
