# Given a digit string, return all possible letter combinations that the number could represent.

# A mapping of digit to letters (just like on the telephone buttons) is given below.

# Input:Digit string "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

######################

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits == ""
  return KEY[digits[0]] if digits.length == 1

  KEY[digits[0]].map do |letter|
    letter_combinations(digits[1..-1]).map {|combo| letter + combo}
  end.flatten
end

KEY = Hash[("2".."6").to_a.zip(("a".."o").each_slice(3).to_a)].merge(
  { 
    "1" => [], 
    "7" => ("p".."s").to_a, 
    "8" => ("t".."v").to_a, 
    "9" => ("w".."z").to_a
  }
)