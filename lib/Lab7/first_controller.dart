import 'package:get/get.dart';

class FirstController extends GetxController{

  RxList<String> fruitList = ['Apple','Mango','Banana','PineApple','Orange'].obs;
  RxList favFruitList = [].obs;

  addToFavourite(String value){
    favFruitList.add(value);
  }

  removeFromFavourite(String value){
    favFruitList.remove(value);
  }

  addFruit(String value){
    fruitList.add(value);
  }

  deleteFruit(int index){
    fruitList.removeAt(index);
  }

}