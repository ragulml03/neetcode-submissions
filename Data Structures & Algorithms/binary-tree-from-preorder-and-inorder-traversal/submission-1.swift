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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        guard !preorder.isEmpty, !inorder.isEmpty else { return nil }

        let rootValue = preorder[0]
        let root = TreeNode(rootValue)
        
        guard let index = inorder.firstIndex(of: rootValue) else { return nil }

        let leftInorderArr = Array(inorder[0..<index])
        let rightInorderArr = Array(inorder[(index + 1)...])

        let leftPreorderArr =  Array(preorder[1..<(leftInorderArr.count + 1)])
        let rightPreorderArr =  Array(preorder[(leftInorderArr.count + 1)...])

        root.left = buildTree(leftPreorderArr, leftInorderArr)
        root.right = buildTree(rightPreorderArr, rightInorderArr)

        return root
    }
}
