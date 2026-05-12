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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        if p?.val != q?.val { return false }

        // guard let first = p, let second = q else { return false }

        var queueP: [TreeNode?] = [p]
        var queueQ: [TreeNode?] = [q]

        while !queueP.isEmpty || !queueQ.isEmpty {
            let nodeP = queueP.removeFirst()
            let nodeQ = queueQ.removeFirst()

            if nodeP == nil && nodeQ == nil { continue }

            if nodeP == nil || nodeQ == nil || nodeP?.val != nodeQ?.val {
                return false
            }

            queueP.append(nodeP?.left)
            queueP.append(nodeP?.right)
            queueQ.append(nodeQ?.left)
            queueQ.append(nodeQ?.right)

        }
        return true
    }
}
