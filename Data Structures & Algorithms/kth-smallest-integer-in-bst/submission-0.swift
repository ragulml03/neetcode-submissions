/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = []
        var current = root
        var count = 0

        while !stack.isEmpty || current != nil {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }

            let node = stack.removeLast()
            count += 1

            if count == k {
                return node.val
            }

            current = node.right
        }
        return -1
    }
}
