class DbModel {
  final int? id;
  final String name;
  final String enrollmentNo;
  final double? grade12th;
  final double? diplomaCgpa;
  final double currentCgpa;
  final String email;
  final String phoneNo;
  final String city;

  DbModel({
    this.id,
    required this.name,
    required this.enrollmentNo,
    this.grade12th,
    this.diplomaCgpa,
    required this.currentCgpa,
    required this.email,
    required this.city,
    required this.phoneNo,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "enrollmentNo": enrollmentNo,
      "grade12th": grade12th,
      "diplomaCgpa": diplomaCgpa,
      "currentCgpa": currentCgpa,
      "email": email,
      "phoneNo": phoneNo,
      "city": city,
    };
  }

  factory DbModel.fromMap(Map<String, dynamic> map) {
    return DbModel(
      id: map["id"],
      name: map["name"],
      enrollmentNo: map["enrollmentNo"],
      grade12th: map["grade12th"],
      diplomaCgpa: map["diplomaCgpa"],
      currentCgpa: map["currentCgpa"],
      email: map["email"],
      city: map["city"],
      phoneNo: map["phoneNo"],
    );
  }
}
