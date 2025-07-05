import 'package:get/get.dart';

class PracController extends GetxController{
  RxDouble opacity = 0.4.obs;
  RxBool notification = false.obs;

  RxList<String> fruitList = ['Apple','Mango','Banana','PineApple','Orange'].obs;
  RxList favFruitList = [].obs;

  setOpacity(double value){
    opacity.value = value;
  }

  setNotification(bool value){
    notification.value = value;
  }

  addToFavourite(String value){
    favFruitList.add(value);
  }

  removeFromFavourite(String value){
    favFruitList.remove(value);
  }

}