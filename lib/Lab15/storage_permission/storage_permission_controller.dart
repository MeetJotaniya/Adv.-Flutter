import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class StoragePermissionController extends GetxController {
  var permissionStatus = 'Unknown'.obs;

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      permissionStatus.value = "Storage permission already granted";
    } else if (status.isDenied) {
      var result = await Permission.storage.request();
      if (result.isGranted) {
        permissionStatus.value = "Storage permission granted";
      } else if (result.isPermanentlyDenied) {
        permissionStatus.value =
        "Permission permanently denied. Please enable it from settings.";
        openAppSettings();
      } else {
        permissionStatus.value = "Storage permission denied";
      }
    } else {
      permissionStatus.value = "Storage permission status: $status";
    }
  }
}
