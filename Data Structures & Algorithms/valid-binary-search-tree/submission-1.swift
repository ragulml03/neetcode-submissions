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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root, min: nil, max: nil)
    }

    func validate(_ nodee: TreeNode?, min: Int?, max: Int?) -> Bool {
        guard let node = nodee else { return true }

        if let maxx = max, node.val >= maxx { return false }

        if let minn = min, node.val <= minn { return false }

        return validate(node.left, min:min, max:node.val) && validate(node.right, min:node.val, max:max)
    }
}
