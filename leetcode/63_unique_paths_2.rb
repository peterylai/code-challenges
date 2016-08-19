# Follow up for "Unique Paths":

# Now consider if some obstacles are added to the grids. How many unique paths would there be?

# An obstacle and empty space is marked as 1 and 0 respectively in the grid.

# For example,
# There is one obstacle in the middle of a 3x3 grid as illustrated below.

# [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]
# The total number of unique paths is 2.

# Note: m and n will be at most 100.

###################################################

# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  ObstacleGrid.new(obstacle_grid).unique_paths
end

class ObstacleGrid
  attr_reader :grid, :length, :width
  attr_accessor :memo

  def initialize(grid)
    @grid = grid
    @length = grid.length
    @width = grid.first.length
    @memo = {}
  end

  def unique_paths
    unique_paths_at(length, width)
  end

  private

  def unique_paths_at(m, n)
    return 0 if grid[-length][-width] == 1
    return 1 if m == 1 && n == 1
    return memo[[n, m]] if memo[[n, m]]
    down_paths = m <= 1 || grid[-m+1][-n] == 1 ? 0 : unique_paths_at(m - 1, n)
    memo[[n, m - 1]] = down_paths
    right_paths = n <= 1 || grid[-m][-n+1] == 1 ? 0 : unique_paths_at(m, n - 1)
    memo[[n - 1, m]] = right_paths
    down_paths + right_paths
  end
end
