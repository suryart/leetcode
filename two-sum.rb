# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Output: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]

# Constraints:

# 2 <= nums.length <= 105
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.


# sol: Since we need to retain the order of the index of each element we cannot sort the array.
# We can use a hash map(key being array element and value being the index) and then continue to iterate over the array and check if any value exists in map
# such that target - value at index = value in hash map

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  result = Array.new(2)
  nums_map = {}
  nums.each_with_index{ |n, i| nums_map[n] = i }
  nums.each_with_index do |n, i|
    index = nums_map[target - n]
    if index && i != index
      result[1] = i
      result[0] = index
    end
  end
  return result
end
