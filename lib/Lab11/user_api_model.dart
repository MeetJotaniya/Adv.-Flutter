class UserApiModel{
  int? id;
  String? name;
  String? city;

  UserApiModel({this.id, this.name, this.city});

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      id: int.tryParse(json['id'].toString()),
      name: json['name'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': name,
      'city': city,
    };
  }
}

