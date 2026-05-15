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
    var diameter = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        calculateHeight(root: root)
        return diameter
    }

    func calculateHeight(root: TreeNode?) -> Int {
        guard let node = root else { return 0 }

        let left = calculateHeight(root: node.left)
        let right = calculateHeight(root: node.right)

        diameter = max(diameter, left + right)

        return max(left, right) + 1
    }
}
