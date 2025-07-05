class Student{
  int? rollNo;
  String? name;
  double? spi;

  Student(int rollNo, String name, double spi){
    this.rollNo = rollNo;
    this.name = name;
    this.spi = spi;
  }

  void displayStudentsDetails(){
    print("Roll No. : $rollNo");
    print("Name : $name");
    print("Spi : $spi");
}

}
void main(){
  Student student = Student(305, 'Meet', 8.69);
  student.displayStudentsDetails();
}




