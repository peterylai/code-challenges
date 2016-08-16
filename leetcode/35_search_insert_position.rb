# Given a sorted array and a target value, return the index if the target is found.
# If not, return the index where it would be if it were inserted in order.

# You may assume no duplicates in the array.

# Here are few examples.
# [1,3,5,6], 5 → 2
# [1,3,5,6], 2 → 1
# [1,3,5,6], 7 → 4
# [1,3,5,6], 0 → 0

#################################

def search_insert(nums, target, offset = 0)
  if nums.length <= 1
    return nums.empty? || nums.first >= target ? offset : offset + 1
  end
  mid = nums.length / 2
  index = case
          when nums[mid] > target
            search_insert(nums[0..mid - 1], target)
          when nums[mid] < target
            search_insert(nums[mid + 1..-1], target, mid + 1)
          else
            mid
          end
  index + offset
end
