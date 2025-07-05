class LikeUnlikeModel{
  List<Map<String,dynamic>> _users = [
    {"name":"Meet","isFav":false},
    {"name":"Parth","isFav":false},
    {"name":"Yash","isFav":false},
    {"name":"Darshan","isFav":false},
    {"name":"Shyam","isFav":false},
    {"name":"Vinit","isFav":false}
  ];

  List<Map<String,dynamic>> get users => _users;

  void insertIntoList(Map<String,dynamic> user){
    _users.add(user);
    print("User is added into the list");
  }
  void favouriteUser(bool isFav, String name){
     int index = _users.indexWhere((element) => element['name'] == name);

    _users[index]["isFav"] = isFav;

    print("User is added into the fav.");
  }
}