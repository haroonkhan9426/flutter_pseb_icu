import 'dart:io';

void main() {
  print('Enter your name please:');
  var name = stdin.readLineSync();
  // print('Your name is $name');
  print('Enter your age please:');
  var ageInput = stdin.readLineSync();
  if (ageInput != null && ageInput.isNotEmpty) {
    int age = int.parse(ageInput);
    print('Your age is: $age');
    int remainingAge = 60 - age;
    print('Your remaining age is: $remainingAge');
  } else {
    print('You have not entered age');
  }
}
