
# # Implement atoi which converts a string to an integer.
# We stop the scanning if the next char after digits is a non digit char.# The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

# The string can contain additional characters after those that form the  return 0 if s.empty?int_min =
int_min = -2147483648 # -2^31
int_min = -2147483648 # -2^31integral number, which are ignored and have no effect on the behavior of this function.

# If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

# If no valid conversion could be performed, a zero value is returned.

# Note:

# Only the space character ' ' is considered a whitespace character.
# Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.


# Example 1:

# Input: str = "42"
# Output: 42
# Example 2:

# Input: str = "   -42"
# Output: -42
# Explanation: The first non-whitespace character is '-', which is the minus sign. Then take as many numerical digits as possible, which gets 42.
# Example 3:

# Input: str = "4193 with words"
# Output: 4193
# Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
# Example 4:

# Input: str = "words and 987"
# Output: 0
# Explanation: The first non-whitespace character is 'w', which is not a numerical digit or a +/- sign. Therefore no valid conversion could be performed.
# Example 5:

# Input: str = "-91283472332"
# Output: -2147483648
# Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer. Thefore INT_MIN (−231) is returned.


# Constraints:

# 0 <= s.length <= 200
# s consists of English letters (lower-case and upper-case), digits, ' ', '+', '-' and '.'.


# Ideas?

# We take a stack and continnue to parse string until we get a +/- or a digit.
# We immediately return 0 if first non whitespace char is an alphabet.
# We stop the scanning if the next char after digits is a non digit char.

# @param {String} s
# @return {Integer}
# def my_atoi(s)
#   return 0 if s.empty?

#   int_min = -2147483648 # -2^31
#   int_max = 2147483647 # 2^32 - 1

#   digits = []
#   found_digits = false
#   index = 0
#   result = 0
#   negative = false
#   s.length.times do |index|
#     char = s[index]
#     break if ((char =~ /\d/) != 0) && found_digits
#     cond = ((char =~ /\d/) != 0) && char != ' ' && !found_digits && !['+', '-'].include?(char)
#     return 0 if cond
#     next if char == ' ' && !found_digits

#     found_digits = true
#     if char == '+' || char == '-'
#       negative = char == '-'
#     elsif ((char =~ /\d/) == 0)
#       digits << char.to_i
#     end

#   end

#   return 0 if digits.empty?

#   digits.each do |num|
#     result = result * 10 + num
#   end

#   result = result * -1 if negative
#   return int_max if (result > int_max)
#   return int_min if (result < int_min)
#   return result
# end

def my_atoi(s)
  return 0 if s.empty?
  int_min = -2147483648 # -2^31
  int_max = 2147483647 # 2^32 - 1
  sign = 1
  index = 0
  result = 0

  while (index < s.length && s[index] == ' ')
    index += 1
  end

  if (s[index] == '+' || s[index] == '-')
    sign = s[index] == '-' ? -1 : 1
    index += 1
  end
  while (index < s.length && ((s[index] =~ /\d/) == 0))
    num = s[index].to_i

    result = result * 10 + num
    index += 1
  end
  if result > int_max
    return (sign == -1) ? int_min : int_max
  end
  return (sign == -1 ? result * -1 : result)
end

# str = " 42"
# p my_atoi(str)

# str = "   -42"
# p my_atoi(str)

# str = "4193 with words"
# p my_atoi(str)

# str = "words and 987"
# p my_atoi(str)

# str = "-91283472332"
# p my_atoi(str)

# str = "   +0 123"
# p my_atoi(str)

# str = "21474836460"
# p my_atoi(str)
