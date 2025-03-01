import 'dart:io';
bool isSubsetSum(List<int> arr, int sum) {
  int n = arr.length;
  List<List<bool>> dp = List.generate(n + 1, (_) => List.filled(sum + 1, false));

  for (int i = 0; i <= n; i++) {
    dp[i][0] = true;
  }
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= sum; j++) {
      if (arr[i - 1] <= j) {
        dp[i][j] = dp[i - 1][j] || dp[i - 1][j - arr[i - 1]];
      } else {
        dp[i][j] = dp[i - 1][j];
      }
    }
  }
  return dp[n][sum];
}
void main() {
  print("Enter the array elements separated by spaces:");
  String? arrayInput = stdin.readLineSync();
  List<int> arr = arrayInput?.split(' ').map((e) => int.parse(e)).toList() ?? [];
  print("Enter the target sum:");
  String? sumInput = stdin.readLineSync();
  int sum = int.tryParse(sumInput ?? '') ?? 0;
  bool result = isSubsetSum(arr, sum);
  print(result ? "True" : "False");
}
