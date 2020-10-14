# Given a string s, find the length of the longest substring without repeating characters.



# Example 1:

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
# Example 2:

# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:

# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
# Example 4:

# Input: s = ""
# Output: 0


# Constraints:

# 0 <= s.length <= 5 * 104
# s consists of English letters, digits, symbols and spaces.

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s.empty?
  max_win_size = 0
  curr_win_size = 0
  repeating_char = nil
  char_hash = Hash.new{ |h, k| h[k] = 0 }
  lp = 0
  rp = 0
  char_hash[s[lp]] += 1
  while lp <= rp && rp < s.length
    if lp != rp
      char_hash[s[rp]] += 1
      repeating_char = s[rp] if char_hash[s[rp]] > 1
    end

    while !repeating_char.nil?
      char = s[lp]
      char_hash[char] -= 1
      if char_hash[char] == 0
        char_hash.delete(char)
      elsif char_hash[char] == 1 && char == repeating_char
        repeating_char = nil
      end
      lp += 1
    end

    curr_win_size = rp - lp + 1
    max_win_size = curr_win_size if repeating_char.nil? && max_win_size < curr_win_size

    rp += 1
  end
  return max_win_size
end

# s = "abcabcbb"
# p length_of_longest_substring(s)

# s = "bb bbb"
# p length_of_longest_substring(s)

# s = "pwwkew"
# p length_of_longest_substring(s)

# s = ""
# p length_of_longest_substring(s)
