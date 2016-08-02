# Reverse digits of an integer.

# Example1: x = 123, return 321
# Example2: x = -123, return -321

#########################################

# @param {Integer} x
# @return {Integer}
def reverse(x)
  reversed = x.to_s.reverse.to_i
  return 0 if reversed > 2**31-1
  x >= 0 ? reversed : -reversed
end