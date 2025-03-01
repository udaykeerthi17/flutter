import 'dart:io';
void sortOddAndEvenNumbers(List<int> numbers) {
  List<int> oddNumbers = [];
  List<int> evenNumbers = [];
  for (int num in numbers) {
    if (num.isOdd) {
      oddNumbers.add(num);
    } else {
      evenNumbers.add(num);
    }
  }
  oddNumbers.sort();
  evenNumbers.sort((a, b) => b.compareTo(a));
  int oddIndex = 0, evenIndex = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i].isOdd) {
      numbers[i] = oddNumbers[oddIndex++];
    } else {
      numbers[i] = evenNumbers[evenIndex++];
    }
  }
}
void main() {
  print("Please enter the numbers separated by spaces:");
  String? input = stdin.readLineSync();
  List<int> numbers = input?.split(' ').map((e) => int.parse(e)).toList() ?? [];
  sortOddAndEvenNumbers(numbers);
  print(numbers.join(' '));
}
