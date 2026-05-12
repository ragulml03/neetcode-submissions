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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }

        var result: [[Int]] = []

        var queue: [TreeNode?] = [node]

        while !queue.isEmpty {
            var size = queue.count
            var tempArr: [Int] = []

            for i in 0..<size {
                var first = queue.removeFirst()

                tempArr.append(first!.val)

                if let left = first?.left {
                    queue.append(left)
                }

                if let right = first?.right {
                    queue.append(right)
                }
            }

            result.append(tempArr)
        }
        return result
    }
}
