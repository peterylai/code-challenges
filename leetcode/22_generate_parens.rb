# Given n pairs of parentheses, write a function to 
# generate all combinations of well-formed parentheses.

# For example, given n = 3, a solution set is:

# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

###################################

# @param {Integer} n
# @return {String[]}

def generate_parenthesis(n)
  print_parens('',n,n)
end

def print_parens(prefix, open, close)
  if open == 0 && close == 1
    return ["#{prefix})"]
  end

  ways = []

  if open > 0
    ways += print_parens("#{prefix}(",open-1, close)
  end

  if close > open
    ways += print_parens("#{prefix})",open, close-1)
  end

  ways
end