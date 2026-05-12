class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int : Int] = [:]
        var result: [Int] = []
        for i in 0..<nums.count {
            dict[nums[i], default: 0] += 1
        }

        var arr = Array(repeating: [Int](), count: nums.count + 1)

        for (key, frequency) in dict {
            arr[frequency].append(key)
        }

        var i = (arr.count - 1)

        while i >= 0 {
            let current = arr[i]

            for num in current {
                result.append(num)

                if result.count == k {
                    return result
                }
            }

            i -= 1
        }
        return []
    }
}
