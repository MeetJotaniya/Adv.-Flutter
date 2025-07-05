abstract class Student {
  void playing() {}

  void driving(){
    print("Students are driving..........");
  }
}

class Child extends Student {
  @override
  void playing() {
    print("child is playing");
  }
}

void main() {
  Child child = Child();
  child.playing();
  child.driving();
}
