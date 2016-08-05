# Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0?
# Find all unique triplets in the array which gives the sum of zero.

# Note: The solution set must not contain duplicate triplets.

# For example, given array S = [-1, 0, 1, 2, -1, -4],

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]

########################

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  sorted = nums.sort
  set = []
  
  sorted[0..-3].each_with_index do |first, i|
    head_index = i+1
    tail_index = sorted.length-1
    while head_index < tail_index
      sum = first + sorted[head_index] + sorted[tail_index]
      if sum == 0
        set << [first, sorted[head_index], sorted[tail_index]]
        head_index += 1
        tail_index -= 1
      elsif sum < 0
        head_index += 1
      else
        tail_index -= 1
      end
    end
  end
  
  set.uniq
end