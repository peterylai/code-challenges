# Given a string containing just the characters '(', ')', '{', '}', '[' and ']',
#  determine if the input string is valid.

# The brackets must close in the correct order, "()" and "()[]{}" are all valid
#  but "(]" and "([)]" are not.

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  characters = s.chars

  while characters.length > 0
    current = characters.shift
    if is_open?(current)
      stack.push(current)
    else
      return false if stack.empty? || !matches?(stack.pop, current)
    end
  end

  stack.empty?
end

def is_open?(s)
  ["(","{","["].include?(s)
end

def matches?(open,close)
  ["()","{}","[]"].include?(open + close)
end