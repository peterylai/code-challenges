# Merge two sorted linked lists and return it as a new list.
# The new list should be made by splicing together the nodes of the first two lists.

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

##########################################

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l2 if l1.nil?
  return l1 if l2.nil?

  if l1.val < l2.val
    list = ListNode.new(l1.val)
    l1 = l1.next
  else
    list = ListNode.new(l2.val)
    l2 = l2.next
  end
  
  list.next = merge_two_lists(l1,l2)
  list
end