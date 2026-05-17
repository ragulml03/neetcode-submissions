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
    func reorderList(_ head: ListNode?) {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var secondHalf = slow?.next
        slow?.next = nil


        var prev: ListNode? = nil
        var current = secondHalf
        while current != nil {
            let tempNext = current?.next
            current?.next = prev
            prev = current
            current = tempNext
        }

        var first = head
        var second = prev

        while second != nil {
            let temp1 = first?.next
            let temp2 = second?.next

            first?.next = second
            second?.next = temp1

            first = temp1
            second = temp2
        }
    }
}
