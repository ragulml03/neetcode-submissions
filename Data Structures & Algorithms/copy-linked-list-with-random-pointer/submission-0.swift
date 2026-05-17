/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

extension Node: Hashable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
    guard let head = head else { return nil }
    var clonedNode: [Node : Node] = [:]
    
    var current: Node? = head
    while let nodee = current {
        clonedNode[nodee] = Node(nodee.val)
        current = nodee.next
    }
    
    current = head
    
    while let tempCurrent = current {
        if let nextNode = tempCurrent.next {
            clonedNode[tempCurrent]?.next = clonedNode[nextNode]
        }
        
        if let randomNode = tempCurrent.random {
            clonedNode[tempCurrent]?.random = clonedNode[randomNode]
        }
        
        current = tempCurrent.next
    }
    
    return clonedNode[head]
}
}
