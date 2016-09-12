# Given an array of non-negative integers,
# you are initially positioned at the first index of the array.

# Each element in the array represents your maximum jump length at that position.

# Determine if you are able to reach the last index.

# For example:
# A = [2,3,1,1,4], return true.

# A = [3,2,1,0,4], return false.


##############################

## My first instict was to use dynamic programming with a memo, but it required too much memory
## This solution is O(n) time and O(1) space

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  last_good_position = nums.length - 1
  (nums.length - 1).downto(0).each do |i|
    last_good_position = i if i + nums[i] >= last_good_position
  end
  last_good_position == 0
end