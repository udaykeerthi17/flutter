import 'dart:io';
int longestSubarray(List<int> arr, int k) {
  int left = 0, sum = 0, maxLength = 0;
  
  for (int right = 0; right < arr.length; right++) {
    sum += arr[right];

    while (sum > k) {
      sum -= arr[left];
      left++;
    }
    maxLength = (right - left + 1) > maxLength ? (right - left + 1) : maxLength;
  }
  return maxLength;
}
void main() {
  print("Enter size of array (N): ");
  int n = int.parse(stdin.readLineSync()!);

  print("Enter array elements (space-separated): ");
  List<int> arr = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  print("Enter target sum (K): ");
  int k = int.parse(stdin.readLineSync()!);

  print("Length of the longest subarray with sum ≤ K: ${longestSubarray(arr, k)}");
}

