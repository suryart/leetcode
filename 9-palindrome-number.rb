# Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

# Follow up: Could you solve it without converting the integer to a string?



# Example 1:

# Input: x = 121
# Output: true
# Example 2:

# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: x = 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
# Example 4:

# Input: x = -101
# Output: false


# Constraints:

# -231 <= x <= 231 - 1


# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative?

  int_max = 2147483647 # 2^32 - 1
  return false if x > int_max

  num = x
  result = 0
  while num != 0
    carry = num % 10
    num /= 10
    result = result * 10 + carry
  end

  x == result
end


# x = 16161
# p is_palindrome(x)

# x = -121
# p is_palindrome(x)

# x = 10
# p is_palindrome(x)

# x = -101
# p is_palindrome(x)

