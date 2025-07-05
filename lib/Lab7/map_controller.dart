import 'package:get/get.dart';

class ListController extends GetxController{

  RxList usersList = <Map<String , dynamic>>[].obs;
  RxBool isEdit = false.obs;
  RxInt index = 0.obs;

  void add(String value){
    usersList.add({"name": value, "isFav" : false});
  }

  void deleteUser(int index){
    usersList.removeAt(index);
  }

  void updateUser(int i, String value) {
    final item = usersList[i];
    item["name"] = value;
    usersList[i] = Map<String, dynamic>.from(item); // Trigger update
  }

}