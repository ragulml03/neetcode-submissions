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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var leftNode = list1
        var rightNode = list2
        let dummy = ListNode(0)
        var tile = dummy
        while leftNode != nil && rightNode != nil {
            if leftNode!.val < rightNode!.val {
                tile.next = leftNode
                leftNode = leftNode?.next
            } else {
                tile.next = rightNode
                rightNode = rightNode?.next
            }
            tile = tile.next!
        }

        tile.next = (leftNode != nil) ? leftNode : rightNode

        return dummy.next
    }
}
