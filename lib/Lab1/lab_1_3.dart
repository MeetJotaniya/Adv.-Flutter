class Student {
  void playing() {
    print("Student is playing");
  }
}

class Child extends Student {
  @override
  void playing() {
    super.playing();
    print("child is playing");
  }
}

void main() {
  Child child = Child();
  child.playing();
}
