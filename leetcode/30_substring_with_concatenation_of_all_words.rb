# You are given a string, s, and a list of words, words, that are all of the same length.
# Find all starting indices of substring(s) in s that is a concatenation
# of each word in words exactly once and without any intervening characters.

# For example, given:
# s: "barfoothefoobarman"
# words: ["foo", "bar"]

# You should return the indices: [0,9].
# (order does not matter).

##############################################

def find_substring(s, words)
  return [] if words.empty?

  indices = []

  word_length = words.first.length

  word_counts = words.each_with_object({}) do |word, counts|
    counts[word] ? counts[word] += 1 : counts[word] = 1
  end

  (s.length - words.join.length + 1).times do |start_index|
    i = start_index
    counts = word_counts.dup
    while counts[s[i, word_length]] && counts[s[i, word_length]] > 0
      counts[s[i, word_length]] -= 1
      i += word_length
    end
    indices.push(start_index) if counts.values.all?(&:zero?)
  end

  indices
end