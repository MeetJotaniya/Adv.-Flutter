//WAP for Handling Specific Exceptions Using on Keyword e.g., FormatException, SocketException.
import 'dart:io';

void main(){
  try{
    print("Enter number 1 : ");
    int a = int.parse(stdin.readLineSync()!);
    print("Enter number 2 : ");
    int b = int.parse(stdin.readLineSync()!);
    
    print(a / b);
  }
  on FormatException{
    print("Please Enter valid formate of the data");
  }
  on SocketException{
    print("Please connect your phone with internet");
  }
  catch(e){
    print("The error is $e");
  }
}