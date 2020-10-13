# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  rem = 0
  node = ListNode.new
  head = node
  prev_node = node
  while l1 && l2
    val = l1.val + l2.val + rem
    rem = val > 9 ? 1 : 0
    val %= 10

    node.val = val
    prev_node = node
    node.next = ListNode.new
    node = node.next
    l1 = l1.next
    l2 = l2.next
  end

  remaining_list = l1 ? l1 : l2

  while remaining_list
    val = remaining_list.val + rem
    rem = val > 9 ? 1 : 0
    val %= 10

    node.val = val
    prev_node = node
    node.next = ListNode.new
    node = node.next
    remaining_list = remaining_list.next
  end

  if rem == 1
    node.val = rem
  else
    prev_node.next = nil
  end

  return head
end
