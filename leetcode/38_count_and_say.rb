# The count-and-say sequence is the sequence of integers beginning as follows:
# 1, 11, 21, 1211, 111221, ...

# 1 is read off as "one 1" or 11.
# 11 is read off as "two 1s" or 21.
# 21 is read off as "one 2, then one 1" or 1211.
# Given an integer n, generate the nth sequence.

# Note: The sequence of integers will be represented as a string.

######################################

# @param {Integer} n
# @return {String}
def count_and_say(n)
  counter = 1
  sequence = 1

  while counter < n
    grouped = sequence.to_s.chars.chunk_while { |i, j| i == j }.to_a
    sequence = grouped.map { |gr| "#{gr.length}#{gr.first}" }.join
    counter += 1
  end

  sequence
end
