/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    var visited: [Int : Node] = [:]
    func cloneGraph(_ node: Node?) -> Node? {
        guard let nodee = node else { return nil }

        if let nodeAvailable = visited[nodee.val] {
            return nodeAvailable
        }

        let newNode = Node(nodee.val)

        visited[nodee.val] = newNode

        for neighbor in nodee.neighbors {
            let clonedNeighbor = cloneGraph(neighbor)
            newNode.neighbors.append(clonedNeighbor)
        }
        return newNode
    }
}
