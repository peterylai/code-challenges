# Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai).
# n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). 
# Find two lines, which together with x-axis forms a container,
# such that the container contains the most water.

# Note: You may not slant the container.

###############################

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  start = 0
  fin = height.length - 1
  max = 0

  while start != fin
    h = [height[start], height[fin]].min
    w = fin - start
    area = h * w
    max = max > area ? max : area # max = [max, area].max
    height[start] < height[fin] ? start += 1 : fin -= 1
  end

  max
end