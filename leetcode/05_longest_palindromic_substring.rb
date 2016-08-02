# Given a string S, find the longest palindromic substring in S. 
# You may assume that the maximum length of S is 1000,
# and there exists one unique longest palindromic substring.

##################################

# @param {String} s
# @return {String}
def longest_palindrome(s)
  longest = []
  st = s.chars

  st.length.times do |i|
    odd_pal = expand_around_middle(st, i, i)
    even_pal = st[i] == st[i + 1] ? expand_around_middle(st, i, i + 1) : []
    longest = [longest, odd_pal, even_pal].max_by(&:length)
  end

  longest.join
end

def expand_around_middle(arr, left, right)
  while (left - 1 >= 0) && (right + 1 < arr.length) && arr[left - 1] == arr[right + 1]
    left -= 1
    right += 1
  end
  arr[left..right]
end