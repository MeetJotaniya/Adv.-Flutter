import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'permission_camera_controller.dart';

class CameraPermissionPage extends StatelessWidget {
  final CameraPermissionController controller = Get.put(CameraPermissionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera Permission with GetX")),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.permissionStatus.value),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.requestCameraPermission,
              child: Text("Request Camera Permission"),
            ),
          ],
        )),
      ),
    );
  }
}
