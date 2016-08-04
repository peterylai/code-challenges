# Write a function to find the longest common prefix
# string amongst an array of strings.

###############

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.length == 0
  return strs[0] if strs.length == 1

  first = strs[0]
  remaining = strs[1..-1]

  longest = []

  i = 0
  while first[i] && remaining.all?{|str| str[i] == first[i]}
    longest << first[i]
    i += 1
  end

  longest.join
end