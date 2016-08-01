# You are given two linked lists representing two non-negative numbers.
# The digits are stored in reverse order and each of their nodes contain a single digit.
# Add the two numbers and return it as a linked list.

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8


######################################################

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  get_list(get_num(l1) + get_num(l2))
end

def get_num(list_head)
  num = []
  node = list_head
  while node
    num.unshift(node.val.to_s)
    node = node.next
  end
  num.join.to_i
end

def get_list(num)
  digits = num.to_s.chars.map(&:to_i)
  list = ListNode.new(digits.shift)
  while digits.length > 0
    node = ListNode.new(digits.shift)
    node.next = list
    list = node
  end
  list
end