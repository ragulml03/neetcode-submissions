class LRUCache {

    class ChacheNode {
        var key: Int
        var value: Int
        var next: ChacheNode?
        var prev: ChacheNode?
        
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    var mainDict: [Int : ChacheNode] = [:]
    var maxCapacity = 0

    var head = ChacheNode(key: -1, value: -1)
    var tail = ChacheNode(key: -1, value: -1)
    

    init(_ capacity: Int) {
        maxCapacity = capacity
        head.next = tail
        tail.prev = head
    }

    func get(_ key: Int) -> Int {
        guard let getVal = mainDict[key] else { return -1 } 
        updateNode(node: getVal)
        return getVal.value
    }

    func put(_ key: Int, _ value: Int) {

        if let getVal = mainDict[key] {
            updateNode(node: getVal)
            mainDict[key]?.value = value
        } else {
            let newNode = ChacheNode(key: key, value: value)
            mainDict[key] = newNode
            addNode(node: newNode)
        }
        
        if mainDict.count > maxCapacity {
            if let removalNode = tail.prev {
            mainDict.removeValue(forKey: removalNode.key)
            removeNode(node: removalNode)
            }
        }
    }

    func addNode(node: ChacheNode) {
        node.prev = head
        node.next = head.next

        head.next?.prev = node
        head.next = node
    }

    func removeNode(node: ChacheNode) {
        let tempNext = node.next
        let tempPrev = node.prev

        tempPrev?.next = tempNext
        tempNext?.prev = tempPrev
    }

    func updateNode(node: ChacheNode) {
        removeNode(node: node)
        addNode(node: node)
    }
}
