# Find the contiguous subarray within an array (containing at least one number)
# which has the largest sum.

# For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
# the contiguous subarray [4,-1,2,1] has the largest sum = 6.

######################################################

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  max_sum = nums.first
  sum = 0
  nums.each do |num|
    sum += num
    max_sum = sum if sum > max_sum
    sum = 0 if sum < 0
  end
  max_sum
end
