# The count-and-say sequence is a sequence of digit strings defined by the recursive formula:

# countAndSay(1) = "1"
# countAndSay(n) is the way you would "say" the digit string from countAndSay(n-1), which is then converted into a different digit string.
# To determine how you "say" a digit string, split it into the minimal number of groups so that each group is a contiguous section all of the same character. Then for each group, say the number of characters, then say the character. To convert the saying into a digit string, replace the counts with a number and concatenate every saying.

# For example, the saying and conversion for digit string "3322251":


# Given a positive integer n, return the nth term of the count-and-say sequence.



# Example 1:

# Input: n = 1
# Output: "1"
# Explanation: This is the base case.
# Example 2:

# Input: n = 4
# Output: "1211"
# Explanation:
# countAndSay(1) = "1"
# countAndSay(2) = say "1" = one 1 = "11"
# countAndSay(3) = say "11" = two 1's = "21"
# countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"


# Constraints:

# 1 <= n <= 30

# @param {Integer} n
# @return {String}
def count_and_say(n)
  return "1" if n == 1
  count_and_say_number("11", n - 1)
end

def count_and_say_number(said_number, n)
  return said_number if n == 1
  si = 0
  ei = 0
  number = ""
  while si <= ei && ei < said_number.length
    if said_number[si] == said_number[ei]
      ei += 1
      next
    end
    number << "#{ei - si}#{said_number[si]}"
    si = ei
  end

  if si < ei
    number << "#{ei - si}#{said_number[si]}"
  end

  count_and_say_number(number, n - 1)
end

# n = 1
# p count_and_say(n)

# n = 10
# p count_and_say(n)# == "31131211131221"

# 1
# 11
# 21
# 1211
# 111221
# 312211
# 13112221
# 1113213211
# 31131211131221
# 13211311123113112211
