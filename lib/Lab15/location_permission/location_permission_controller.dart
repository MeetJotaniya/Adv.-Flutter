import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var locationStatus = 'Unknown'.obs;
  var latitude = ''.obs;
  var longitude = ''.obs;

  Future<void> getUserLocation() async {
    var permission = await Permission.location.status;

    if (permission.isGranted) {
      await _getCurrentLocation();
    } else if (permission.isDenied) {
      var result = await Permission.location.request();
      if (result.isGranted) {
        await _getCurrentLocation();
      } else if (result.isPermanentlyDenied) {
        locationStatus.value =
        'Permission permanently denied. Please enable it in settings.';
        openAppSettings();
      } else {
        locationStatus.value = 'Location permission denied.';
      }
    } else {
      locationStatus.value = 'Permission status: $permission';
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude.value = position.latitude.toString();
      longitude.value = position.longitude.toString();
      locationStatus.value = "Location fetched successfully.";
    } catch (e) {
      locationStatus.value = "Error getting location: $e";
    }
  }
}
