# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".



# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.


# Constraints:

# 0 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lower-case English letters.

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty?
  return strs[0] if strs.length == 1

  longest_common_prefix = ""
  i = 0
  while i < strs[0].length && i < strs[1].length && strs[0][i] == strs[1][i]
    longest_common_prefix[i] = strs[0][i]
    i += 1
  end

  strs_index = 2

  while strs_index < strs.length
    string = strs[strs_index]
    newprefix = ""
    i = 0
    while i < string.length && longest_common_prefix[i] == string[i]
      newprefix[i] = longest_common_prefix[i]
      i += 1
    end

    longest_common_prefix = newprefix if newprefix.length < longest_common_prefix.length
    strs_index += 1
  end
  return longest_common_prefix
end

# strs = ["flower","flow","flight"]
# p longest_common_prefix(strs)

# strs = ["dog","doracecar","dcar"]
# p longest_common_prefix(strs)
