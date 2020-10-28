# Given a sorted linked list, delete all duplicates such that each element appear only once.

# Example 1:

# Input: 1->1->2
# Output: 1->2
# Example 2:

# Input: 1->1->2->3->3
# Output: 1->2->3

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  node = head
  prev_node = node
  while node
    if prev_node.val != node.val
      prev_node.next = node
      prev_node = node
    end

    node = node.next
  end
  prev_node.next = nil if !prev_node.nil?

  return head
end
