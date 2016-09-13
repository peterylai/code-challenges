# @param {Integer[]} nums
# @return {Integer[][]}

# nums.permutation.to_a is the much easier built in ruby way

def permute(nums)
  return [nums] if nums.length <= 1
  all_permutations = nums.map do |num|
    permute(nums - [num]).map do |permutations_without_num|
      [num] + permutations_without_num
    end
  end.flatten(1)
  all_permutations
end
