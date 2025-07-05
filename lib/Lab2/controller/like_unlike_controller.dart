import 'package:adv_flutter_lab/Lab2/model/like_unlike_model.dart';

class LikeUnlikeController{
  LikeUnlikeModel _model = LikeUnlikeModel();

  get users => _model.users;

  void insertIntoList(Map<String , dynamic> user){
    _model.insertIntoList(user);
  }
  void favouriteUser(bool isFav, String name){
    _model.favouriteUser(isFav, name);
  }
}