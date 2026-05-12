class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int : Int] = [:]
        for i in 0..<nums.count {
            let checkDiff = target - nums[i]
            if let index = dict[checkDiff] {
                return [index, i]
            } else {
                dict[nums[i]] = i
            }
        }
        return [0,0]
    }
}
