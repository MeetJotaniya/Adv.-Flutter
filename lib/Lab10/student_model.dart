class StudentModel {
  final int? id;
  final String name;
  final String enrollmentNo;

  StudentModel({this.id, required this.name, required this.enrollmentNo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'enrollmentNo': enrollmentNo,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      enrollmentNo: map['enrollmentNo'],
    );
  }
}
