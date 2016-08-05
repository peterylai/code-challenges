# Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target.
# Return the sum of the three integers.
# You may assume that each input would have exactly one solution.

# For example, given array S = {-1 2 1 -4}, and target = 1.

# The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

def three_sum_closest(nums, target)
  sorted = nums.sort
  curr_closest = nums[0..2].reduce(:+)
  
  sorted[0..-3].each_with_index do |first, i|
    head_index = i+1
    tail_index = sorted.length-1

    while head_index < tail_index
      sum = first + sorted[head_index] + sorted[tail_index]
      curr_closest = closer(curr_closest, sum, target)
      return curr_closest if curr_closest == target

      if sum < target
        head_index += 1
      else
        tail_index -= 1
      end
    end
  end
  
  curr_closest
end

def closer(current, new_sum, target)
  (new_sum - target).abs < (current - target).abs ? new_sum : current
end