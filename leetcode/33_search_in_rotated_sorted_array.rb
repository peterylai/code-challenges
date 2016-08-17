# Suppose a sorted array is rotated at some pivot unknown to you beforehand.

# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

# You are given a target value to search.
# If found in the array return its index, otherwise return -1.

# You may assume no duplicate exists in the array.

####################################

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target, offset = 0)
  if nums.length < 5
    return nums.index(target) ? nums.index(target) + offset : -1
  end

  mid = nums.length / 2
  left_sorted = nums.first < nums[mid]
  in_left_range = (nums.first...nums[mid]).cover?(target)
  in_right_range = (nums[mid]..nums.last).cover?(target)

  index =
    if (left_sorted && in_left_range) || (!left_sorted && !in_right_range)
      search(nums[0...mid], target)
    else
      search(nums[mid..-1], target, mid)
    end

  index < 0 ? index : index + offset
end

######################################

require 'minitest/autorun'

class TestSearch < MiniTest::Unit::TestCase
  def test_empty_array
    assert_equal -1, search([], 1)
  end

  def test_not_found_array_with_one_item
    assert_equal -1, search([1], 2)
  end

  def test_found_array_with_one_item
    assert_equal 0, search([1], 1)
  end

  def test_left_side_of_larger_array
    assert_equal 2, search([4, 5, 6, 7, 0, 1, 2], 6)
  end

  def test_right_side_of_larger_array
    assert_equal 5, search([4, 5, 6, 7, 0, 1, 2], 1)
  end
end
