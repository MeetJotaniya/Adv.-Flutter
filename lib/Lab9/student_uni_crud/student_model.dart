
import 'package:adv_flutter_lab/Lab9/student_uni_crud/string_constants.dart';

class StudentModel{
  int? id;
  String? name;
  String? enrollment;
  String? grade12;
  String? diplomaCGPA;
  int? universityId;

  StudentModel(
      {this.id, this.name, this.enrollment, this.grade12, this.diplomaCGPA, this.universityId});

  Map<String , dynamic> toMap() => {
      COL_STUDENT_ID : id,
      COL_STUDENT_NAME : name,
      COL_STUDENT_ENROLLMENT : enrollment,
      COL_GRADE12 : grade12,
      COL_CGPA : diplomaCGPA,
      COL_UNIVERSITY_ID  : universityId
  };

  factory StudentModel.fromMap(Map<String , dynamic> map){
      return StudentModel(
        id : map[COL_STUDENT_ID],
        name : map[COL_STUDENT_NAME],
        enrollment : map[COL_STUDENT_ENROLLMENT],
        grade12 : map[COL_GRADE12],
        diplomaCGPA : map[COL_CGPA],
        universityId : map[COL_UNIVERSITY_ID]
      );
  }
}