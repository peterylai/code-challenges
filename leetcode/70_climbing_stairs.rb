# You are climbing a stair case.
# It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps.
# In how many distinct ways can you climb to the top?

####################

## After manually writing out the first couple, it's apparent that this is just a fib sequence in disguise

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  first = 1
  second = 2

  (3..n).each do
    first, second = second, first + second
  end

  second
end
