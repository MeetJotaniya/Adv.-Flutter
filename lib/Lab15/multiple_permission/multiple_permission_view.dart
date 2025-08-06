import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../camer_permission/permission_camera_controller.dart';
import '../location_permission/location_permission_controller.dart';
import '../storage_permission/storage_permission_controller.dart';

class MultiPermissionPage extends StatelessWidget {
  final cameraController = Get.put(CameraPermissionController());
  final storageController = Get.put(StoragePermissionController());
  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multiple Permissions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Text('Camera: ${cameraController.permissionStatus.value}')),
            SizedBox(height: 10),
            Obx(() => Text('Storage: ${storageController.permissionStatus.value}')),
            SizedBox(height: 10),
            Obx(() => Text('Location: ${locationController.locationStatus.value}')),

            SizedBox(height: 30),

            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Request Camera"),
              onPressed: () => cameraController.requestCameraPermission(),
            ),
            SizedBox(height: 10),

            ElevatedButton.icon(
              icon: Icon(Icons.folder),
              label: Text("Request Storage"),
              onPressed: () => storageController.requestStoragePermission(),
            ),
            SizedBox(height: 10),

            ElevatedButton.icon(
              icon: Icon(Icons.location_on),
              label: Text("Request Location"),
              onPressed: () => locationController.getUserLocation(),
            ),
          ],
        ),
      ),
    );
  }
}
