/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var dummy = ListNode(0)
        var tail = dummy

        var currentL1 = l1
        var currentL2 = l2
        var carry = 0
        while currentL1 != nil || currentL2 != nil || carry > 0 {
            let val1 = currentL1?.val ?? 0

            let val2 = currentL2?.val ?? 0

            let sum = val1 + val2 + carry

            carry = sum / 10
            let digit = sum % 10

            let newNode = ListNode(digit)

            tail.next = ListNode(digit)
            tail = tail.next!


            currentL1 = currentL1?.next
            currentL2 = currentL2?.next
        }
        return dummy.next
    }
}
