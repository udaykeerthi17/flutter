import 'dart:io';

String expandString(String input) {
  String result = '';
  int i = 0;

  while (i < input.length) {
    String char = input[i];
    int j = i + 1;
    String numStr = '';

    while (j < input.length && input[j].contains(RegExp(r'[0-9]'))) {
      numStr += input[j];
      j++;
    }

    int repeatCount = int.parse(numStr);
    result += char * repeatCount;
    i = j;
  }

  return result;
}

void main() {
  print("Enter a string with characters followed by numbers : ");
  String input = stdin.readLineSync() ?? '';
  
  String output = expandString(input);
  print("Expanded String: $output");
}
