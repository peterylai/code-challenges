# Implement atoi to convert a string to an integer.

# Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.

# Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.

################

# @param {String} str
# @return {Integer}
def my_atoi(str)
  int = str.to_i #cheating
  return 2147483647 if int > 2147483647
  return -2147483648 if int < -2147483648
  int
end