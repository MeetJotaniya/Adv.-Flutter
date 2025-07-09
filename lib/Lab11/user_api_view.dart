import 'package:adv_flutter_lab/Lab11/user_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserView extends StatelessWidget {
  final UserApiController controller = Get.put(UserApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Users')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: controller.filterUsers,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.state.value == UserState.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.state.value == UserState.error) {
                return Center(child: Text(controller.errorMessage.value));
              } else if (controller.filteredUsers.isEmpty) {
                return Center(child: Text("No users found."));
              } else {
                return ListView.builder(
                  itemCount: controller.filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.filteredUsers[index];
                    return ListTile(
                      title: Text(user.name ?? 'No Name'),
                      subtitle: Text(user.city ?? ''),
                    );
                  },
                );
              }
            })

          ),
        ],
      ),
    );
  }
}