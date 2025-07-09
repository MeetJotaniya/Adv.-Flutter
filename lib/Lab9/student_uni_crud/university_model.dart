
import 'package:adv_flutter_lab/Lab9/student_uni_crud/string_constants.dart';

class UniversityModel{

  String? name;
  String? enrollment;
  String? diplomaCGPA;
  String? universityName;

  UniversityModel({this.name , this.enrollment , this.diplomaCGPA , required this.universityName});

  Map<String , dynamic> toMap() => {
    COL_UNI_NAME : name
  };

  factory UniversityModel.fromMap(Map<String , dynamic> map){
    return UniversityModel(
      name: map[COL_STUDENT_NAME],
      enrollment: map[COL_STUDENT_ENROLLMENT],
      diplomaCGPA: map[COL_CGPA],
      universityName: map[COL_UNI_NAME]
    );
  }

}