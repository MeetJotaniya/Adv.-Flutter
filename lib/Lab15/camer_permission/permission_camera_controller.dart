import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPermissionController extends GetxController {
  var permissionStatus = 'Unknown'.obs;

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;

    if (status.isGranted) {
      permissionStatus.value = "Camera permission already granted";
    } else if (status.isDenied) {
      var result = await Permission.camera.request();
      if (result.isGranted) {
        permissionStatus.value = "Camera permission granted";
      } else if (result.isPermanentlyDenied) {
        permissionStatus.value =
        "Permission permanently denied. Please enable it from settings.";
        openAppSettings();
      } else {
        permissionStatus.value = "Camera permission denied";
      }
    } else {
      permissionStatus.value = "Camera permission status: $status";
    }
  }
}
