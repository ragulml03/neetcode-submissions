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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        var maxDepth = 0
        var queue: [TreeNode] = [node]

        while !queue.isEmpty {
            for i in 0..<queue.count {
            let firstNode = queue.removeFirst()

            if let leftNode = firstNode.left { queue.append(leftNode) }
            if let rightNode = firstNode.right { queue.append(rightNode) }
            }
            maxDepth += 1
        }
        return maxDepth
    }
}
