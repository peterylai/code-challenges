# Merge k sorted linked lists and return it as one sorted list.
# Analyze and describe its complexity.

######################

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  master = []

  lists.each do |list|
    while list
      master << list.val
      list = list.next
    end
  end
  
  sorted = master.sort
  
  head = ListNode.new(sorted.shift)
  tail = head
  
  while sorted.length > 0
    node = ListNode.new(sorted.shift)
    tail.next = node
    tail = node
  end
  
  head
end

# This solution is nlog(n) - the sorting takes the longest.
# Could improve it to nlog(k) by using a mergesort 
# instead of throwing everything in the master list and using ruby's sort which is quicksort under the hood