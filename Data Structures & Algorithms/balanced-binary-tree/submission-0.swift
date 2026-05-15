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
    func isBalanced(_ root: TreeNode?) -> Bool {
        balanceCheck(root: root) != -1
    }

    func balanceCheck(root: TreeNode?) -> Int {
        guard let node = root else { return 0 }

        let left = balanceCheck(root: node.left)
        if left == -1 { return -1 }
        let right = balanceCheck(root: node.right)
        if right == -1 { return -1 }

        if abs(left - right) > 1 {
            return -1
        }

        return max(left, right) + 1
    }
}
