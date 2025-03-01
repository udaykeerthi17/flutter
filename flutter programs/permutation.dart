import 'dart:io';
void permute(List<int> nums, List<int> path, Set<int> used, Set<List<int>> result) {
  if (path.length == nums.length) {
    result.add(List.from(path));
    return;
  }
  for (int i = 0; i < nums.length; i++) {
    if (used.contains(i) || (i > 0 && nums[i] == nums[i - 1] && !used.contains(i - 1))) {
      continue;
    }
    used.add(i);
    path.add(nums[i]);
    permute(nums, path, used, result);
    path.removeLast();
    used.remove(i);
  }
}
List<List<int>> uniquePermutations(List<int> nums) {
  nums.sort();
  Set<List<int>> result = {};
  permute(nums, [], {}, result);
  return result.toList();
}
void main() {
  print("Enter numbers (space-separated): ");
  List<int> nums = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  List<List<int>> permutations = uniquePermutations(nums);
  for (var perm in permutations) {
    print(perm);
  }
}

