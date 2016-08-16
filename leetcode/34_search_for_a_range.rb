# Given a sorted array of integers, find the starting and ending position of a given target value.

# Your algorithm's runtime complexity must be in the order of O(log n).

# If the target is not found in the array, return [-1, -1].

# For example,
# Given [5, 7, 7, 8, 8, 10] and target value 8,
# return [3, 4].

##################################

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
 index = nums.bsearch_index{|x| x == target}
 index.nil? ? [-1,-1] : expand_around(nums, target, index)
end

def expand_around(nums, target, index)
  start = index
  finish = index
  while nums[start-1] == target && start-1 >= 0
    start -= 1
  end
  while nums[finish+1] == target
    finish += 1
  end
  [start,finish]
end