class Car {
  int? noOfTyers;
  String? color;
}

class Alto extends Car {
  Alto(int noOfTyers, String color) {
    this.noOfTyers = noOfTyers;
    this.color = color;
  }

  void displayDetails() {
    print("No of tyers are $noOfTyers and color is $color");
  }
}

void main() {
  Alto alto = Alto(4, "White");
  alto.displayDetails();
}
