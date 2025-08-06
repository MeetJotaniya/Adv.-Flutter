import 'dart:io';

void main(){

  print("Enter number 1 : ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter number 2 : ");
  int b = int.parse(stdin.readLineSync()!);

  try{
    int c = a~/b;
    print("ans is : $c");
  }
  on IntegerDivisionByZeroException{
    print("You can't divide by zero.");
  }
  catch(e){
    print("The error is : $e");
  }
}