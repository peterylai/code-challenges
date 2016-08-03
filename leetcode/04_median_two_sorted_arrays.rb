# There are two sorted arrays nums1 and nums2 of size m and n respectively.

# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

# Example 1:
# nums1 = [1, 3]
# nums2 = [2]

# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]

# The median is (2 + 3)/2 = 2.5

#####################################

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  len1, len2 = nums1.length, nums2.length
  return median((nums1 + nums2).sort) if len1 <= 3 || len2 <= 3

  med1, med2 = median(nums1), median(nums2)
  return med1 if med1 == med2

  cut = [len1,len2].min/2 - 1
  if med1 > med2
    first, second = right_side(nums2, cut), left_side(nums1, cut)
  else
    first, second = right_side(nums1, cut), left_side(nums2, cut)
  end
  
  find_median_sorted_arrays(first, second)
end

def median(nums)
  (nums[(nums.length - 1) / 2] + nums[ nums.length / 2]) / 2.0    
end

def left_side(nums, cut)
  nums[0..-cut-1]
end

def right_side(nums, cut)
  nums[cut..-1]
end