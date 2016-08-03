# Implement regular expression matching with support for '.' and '*'.

# '.' Matches any single character.
# '*' Matches zero or more of the preceding element.

# The matching should cover the entire input string (not partial).

# The function prototype should be:
# bool isMatch(const char *s, const char *p)

# Some examples:
# isMatch("aa","a") → false
# isMatch("aa","aa") → true
# isMatch("aaa","aa") → false
# isMatch("aa", "a*") → true
# isMatch("aa", ".*") → true
# isMatch("ab", ".*") → true
# isMatch("aab", "c*a*b") → true

######################

# @param {String} s
# @param {String} p
# @return {Boolean}
MEMO = {}

def is_match(s, p)
  return MEMO[[s,p]] if !MEMO[[s,p]].nil?

  if p.length == 0
    return s.length == 0 ? true : false
  end

  char = p[0]
  has_star = '*' == p[1]

  if !has_star
    if s.length == 0 || (char != '.' && s[0] != char)
      MEMO[[s,p]] = false
      return false 
    end

    return is_match(s[1..-1], p[1..-1])
  else
    regex = p[2..-1]
    does_match = is_match(s, regex)

    offset = 0
    condition = char == '.' ? "offset < s.length" : "s[offset] == char"
    while eval condition
      offset += 1
      does_match ||= is_match(s[offset..-1], regex)
    end

    MEMO[[s,p]] = does_match
    return does_match
  end
end


####################


require 'minitest/autorun'

class TestIsMatch < MiniTest::Unit::TestCase

  def test_aa_a
    assert_equal false, is_match("aa","a")
  end

  def test_aa_aa
    assert_equal true, is_match("aa","aa")
  end

  def test_aaa_aa
    assert_equal false, is_match("aaa","aa")
  end

  def test_multiple
    assert_equal true, is_match("aa","a*")
  end

  def test_wildcard
    assert_equal true, is_match("aa",".*")
  end

  def test_another_wildcard
    assert_equal true, is_match("ab",".*")
  end

  def test_cab
    assert_equal true, is_match("aab","c*a*b")
  end
end