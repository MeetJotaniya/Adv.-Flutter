class Counter {
  static int COUNTER = 1;
}

class AddingValue{
  void AddingValuesToTheNumber(int number){
    Counter.COUNTER = Counter.COUNTER + number;
  }
  void display(){
    print("The value of the cunter is ${Counter.COUNTER}");
  }
}

void main(){
  AddingValue addingValue = AddingValue();
  addingValue.AddingValuesToTheNumber(5);
  addingValue.display();
}

