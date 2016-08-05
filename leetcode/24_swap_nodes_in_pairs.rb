# Given a linked list, swap every two adjacent nodes and return its head.

# For example,
# Given 1->2->3->4, you should return the list as 2->1->4->3.

# Your algorithm should use only constant space.
# You may not modify the values in the list, only nodes itself can be changed.

###########################

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return head if head.nil? || head.next.nil?
  
  temp = head
  head = head.next
  temp.next = head.next
  head.next = temp
  node = head.next

  while node.next && node.next.next
    temp = node.next
    node.next = temp.next
    temp.next = node.next.next
    node.next.next = temp
    node = node.next.next        
  end
  
  head
end