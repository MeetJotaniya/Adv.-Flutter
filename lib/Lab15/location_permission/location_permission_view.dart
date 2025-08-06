import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'location_permission_controller.dart';


class LocationPage extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Location with GetX")),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Status: ${controller.locationStatus.value}"),
            SizedBox(height: 10),
            Text("Latitude: ${controller.latitude.value}"),
            Text("Longitude: ${controller.longitude.value}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.getUserLocation,
              child: Text("Get Current Location"),
            ),
          ],
        )),
      ),
    );
  }
}
