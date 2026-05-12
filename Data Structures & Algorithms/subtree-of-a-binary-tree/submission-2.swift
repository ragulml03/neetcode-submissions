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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        var current = root
        var stack: [TreeNode?] = []
        if let currentt = current {
            stack.append(currentt)
        }

        while !stack.isEmpty {

            let lastNode = stack.removeLast()
            if validateValidtree(p:lastNode, q:subRoot) {
                return true
            }

            if let right = lastNode?.right {
                stack.append(right)
            }

            if let left = lastNode?.left {
                stack.append(left)
            }
        }

        return false
    }

    func validateValidtree(p: TreeNode?, q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil || p!.val != q!.val{ return false }

        return validateValidtree(p: p!.left,q:q!.left) && validateValidtree(p: p!.right,q:q!.right)
    }
}
