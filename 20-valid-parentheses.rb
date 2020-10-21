# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.


# Example 1:

# Input: s = "()"
# Output: true
# Example 2:

# Input: s = "()[]{}"
# Output: true
# Example 3:

# Input: s = "(]"
# Output: false
# Example 4:

# Input: s = "([)]"
# Output: false
# Example 5:

# Input: s = "{[]}"
# Output: true


# Constraints:

# 1 <= s.length <= 104
# s consists of parentheses only '()[]{}'.

# @param {String} s
# @return {Boolean}
def is_valid(s)
  return false if (s.length%2 != 0)

  brackets_map = { ')' => '(', '}' => '{', ']' => '['  }
  brackets = []
  s.length.times do |i|
    if  ['(', '{', '['].include?(s[i])
      brackets << s[i]
    elsif brackets_map.key?(s[i])
      return false if brackets.last != brackets_map[s[i]]
      brackets.pop
    end
  end

  return brackets.empty?
end

# s = "()"
# p is_valid(s)

# s = "()[]{}"
# p is_valid(s)

# s = "(]"
# p is_valid(s)

# s = "([)]"
# p is_valid(s)

# s = "{[]}"
# p is_valid(s)

# s = "(){}}{"
# p is_valid(s)

# s = "([}}])"
# p is_valid(s)

# s = "){"
# p is_valid(s)
