# Given a linked list, remove the nth node from the end of list and return its head.

# For example,

#    Given linked list: 1->2->3->4->5, and n = 2.
#    After removing the second node from the end, the linked list becomes 1->2->3->5.

# Note:
# Given n will always be valid.
# Try to do this in one pass.

##########################################

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  prev = nth_from_end(head, n+1)[:match]

  if prev
    prev.next = prev.next.next
    head
  else
    head.next
  end
end

def nth_from_end(node, n)
  if node.next.nil?
    wrapper = {counter: 1, match: nil} 
  else
    next_wrapper = nth_from_end(node.next, n)
    wrapper = {
      counter: 1 + next_wrapper[:counter],
      match: next_wrapper[:match]
    }
  end

  if wrapper[:counter] == n
    wrapper[:match] = node
  end

  wrapper
end