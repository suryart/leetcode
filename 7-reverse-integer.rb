# Given a 32-bit signed integer, reverse digits of an integer.

# Note:
# Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.



# Example 1:

# Input: x = 123
# Output: 321
# Example 2:

# Input: x = -123
# Output: -321
# Example 3:

# Input: x = 120
# Output: 21
# Example 4:

# Input: x = 0
# Output: 0


# Constraints:

# -231 <= x <= 231 - 1

# @param {Integer} x
# @return {Integer}
def reverse(x)
  return 0 if x == 0
  negative = x < 0
  num = negative ? x * -1 : x
  result = 0

  while num != 0
    result = result * 10 + num % 10
    num = num/10
  end
  return 0 if result > 2147483647 # 2^32 - 1
  result = negative ? result * -1 : result
  return result
end

x = 123
p reverse(x)

x = -123
p reverse(x)

x = 120
p reverse(x)

x = 0
p reverse(x)
