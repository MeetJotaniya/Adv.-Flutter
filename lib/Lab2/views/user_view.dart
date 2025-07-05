import 'package:flutter/material.dart';
import '../controller/user_controller.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserController.user;

    return Scaffold(
      appBar: AppBar(title: Text("User Profile Card")),
      backgroundColor: Colors.black87,
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                SizedBox(height: 10),
                Text(user.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(user.email!, style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text(user.number!, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
