import 'package:get/get.dart';
import '../model/dialog_model.dart';

class DialogController extends GetxController {
  void showDialogBox(DialogModel model) {
    Get.defaultDialog(
      title: model.title ?? "No Title",
      middleText: model.message ?? "No message",
      textConfirm: "OK",
      textCancel: "Cancel",
      onConfirm: () => Get.back(),
      onCancel: () => Get.back(),
    );
  }
}

