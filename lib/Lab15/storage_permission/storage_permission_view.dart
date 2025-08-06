import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'storage_permission_controller.dart';

class StoragePermissionPage extends StatelessWidget {
  final StoragePermissionController controller =
  Get.put(StoragePermissionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Storage Permission with GetX")),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.permissionStatus.value),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.requestStoragePermission,
              child: Text("Request Storage Permission"),
            ),
          ],
        )),
      ),
    );
  }
}
