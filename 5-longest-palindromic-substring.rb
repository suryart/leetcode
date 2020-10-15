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
  max_palindrom = ""
  s.length.times do |i|
    substring = longest_palindrome_substring(s, i, i)
    max_palindrom = substring if substring.length > max_palindrom.length
    substring = longest_palindrome_substring(s, i, i+1)
    max_palindrom = substring if substring.length > max_palindrom.length
  end
  return max_palindrom
end

def longest_palindrome_substring(s, left_index, right_index)
  palindromic_string = ""
  while left_index >= 0 && right_index < s.length && s[left_index] == s[right_index]
    palindromic_string = s[left_index..right_index]
    left_index -= 1
    right_index += 1
  end
  palindromic_string
end

# s = "babad"
# p longest_palindrome(s)

# s = "cbbd"
# p longest_palindrome(s)

# s = "a"
# p longest_palindrome(s)

# s = "ac"
# p longest_palindrome(s)
