# Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.



# Example 1:
# Input: nums = [1,3,5,6], target = 5
# Output: 2

# Example 2:
# Input: nums = [1,3,5,6], target = 2
# Output: 1

# Example 3:
# Input: nums = [1,3,5,6], target = 7
# Output: 4

# Example 4:
# Input: nums = [1,3,5,6], target = 0
# Output: 0

# Example 5:
# Input: nums = [1], target = 0
# Output: 0


# Constraints:

# 1 <= nums.length <= 104
# -104 <= nums[i] <= 104
# nums contains distinct values sorted in ascending order.
# -104 <= target <= 104

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  bsearch_index(nums, 0, nums.length - 1, target)
end

def bsearch_index(nums, left, right, target)
  return -1 if left > right

  mid = left + (right - left) / 2
  return mid if nums[mid] == target
  return mid if mid == left && nums[mid] > target
  return mid+1 if mid == right && nums[mid] < target

  if nums[mid] < target
    return bsearch_index(nums, mid+1, right, target)
  else
    return bsearch_index(nums, left, mid, target)
  end
end

# nums = [1,3,5,6]
# target = 5
# p search_insert(nums, target)

# nums = [1,3,5,6]
# target = 2
# p search_insert(nums, target)

# nums = [1,3,5,6]
# target = 7
# p search_insert(nums, target)

# nums = [1,3,5,6]
# target = 0
# p search_insert(nums, target)

# nums = [1]
# target = 0
# p search_insert(nums, target)
