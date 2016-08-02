# Determine whether an integer is a palindrome.
# Do this without extra space.

#############################

# @param {Integer} x
# @return {Boolean}

# def is_palindrome(x)
#   x.to_s == x.to_s.reverse
# end

def is_palindrome(x)
  return false if x < 0

  magnitude = 1
  while x / magnitude >= 10
    magnitude *= 10
  end

  while x != 0
    first_dig = x / magnitude
    last_dig = x % 10
    return false if first_dig!= last_dig

    x = (x % magnitude) / 10
    magnitude /= 100
  end

  true
end