# The string "PAYPALISHIRING" is written in a zigzag pattern 
# on a given number of rows like this: 

# P   A   H   N
#  A P L S I I G
#   Y   I   R

# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given a number of rows:

# string convert(string text, int nRows);
# convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".

############################

# @param {String} s
# @param {Integer} num_rows
# @return {String}

# 3
# 0 -   0   4   8
# 1 -    1 3 5 7
# 2 -     2   6 

# 4

# 0 - 0     6     12
# 1 -  1   5 7   11
# 2 -   2 4   8 10
# 3 -    3     9

# 5
# 0 - 0       8
# 1 -  1     7 9
# 2 -   2   6   10
# 3 -    3 5     11
# 4 -     4       12

def convert(s, num_rows)
  return s if num_rows == 1
  st = s.chars
  converted = []
  full_cycle = (num_rows - 1)*2

  num_rows.times do |n|
    i = n
    if n == 0 || n == num_rows - 1
      while st[i]
        converted << st[i]
        i += full_cycle
      end 
    else
      gap = full_cycle - 2 * n
      while st[i]
        converted << st[i]
        converted << st[i + gap]
        i += full_cycle
      end
    end
  end

  converted.join
end