# A robot is located at the top-left corner of a m x n grid
# (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time.
# The robot is trying to reach the bottom-right corner of the grid
# (marked 'Finish' in the diagram below).

# How many possible unique paths are there?
# Note: m and n will be at most 100.

####################################################

# @param {Integer} m
# @param {Integer} n
# @return {Integer}

MEMO = {}

def unique_paths(m, n)
  return 1 if m == 1 || n == 1
  return MEMO[[n, m].sort] if MEMO[[n, m].sort]

  down_paths = unique_paths(m - 1, n)
  MEMO[[n, m - 1].sort] = down_paths

  right_paths = unique_paths(m, n - 1)
  MEMO[[n - 1, m].sort] = right_paths

  down_paths + right_paths
end
