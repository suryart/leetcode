# Given a string s, return the longest palindromic substring in s.



# Example 1:

# Input: s = "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:

# Input: s = "cbbd"
# Output: "bb"
# Example 3:

# Input: s = "a"
# Output: "a"
# Example 4:

# Input: s = "ac"
# Output: "a"


# Constraints:

# 1 <= s.length <= 1000
# s consist of only digits and English letters (lower-case and/or upper-case),

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return "" if s.nil? || s.length < 1
  start_index = 0
  end_index = 0
  s.length.times do |i|
    len1 = longest_palindrome_substring(s, i, i)
    len2 = longest_palindrome_substring(s, i, i+1)
    len = len1 > len2 ? len1 : len2
    if len > (end_index - start_index)
      start_index = i - (len - 1)/2
      end_index = i + len/2
    end
  end
  return s[start_index..end_index]
end

def longest_palindrome_substring(s, left_index, right_index)
  while left_index >= 0 && right_index < s.length && s[left_index] == s[right_index]
    left_index -= 1
    right_index += 1
  end
  right_index - left_index - 1
end

# s = "babad"
# p longest_palindrome(s)

# s = "cbbd"
# p longest_palindrome(s)

# s = "a"
# p longest_palindrome(s)

# s = "ac"
# p longest_palindrome(s)
