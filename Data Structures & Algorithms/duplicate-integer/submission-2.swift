class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var dict: [Int : Int] = [:]
        for i in 0..<nums.count {
            if let _ = dict[nums[i]] {
                return true
            }
            dict[nums[i]] = i
        }
        return false
    }
}
