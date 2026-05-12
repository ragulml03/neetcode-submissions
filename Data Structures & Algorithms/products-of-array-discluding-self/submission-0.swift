class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var tempArr = Array(repeating: 1, count: nums.count)
        var leftIncreamentar = 1
        for i in 0..<nums.count {
            tempArr[i] = leftIncreamentar
            leftIncreamentar *= nums[i]
        }

        var rightIncreamentar = 1
        var last = nums.count - 1

        while last >= 0 {
            tempArr[last] = tempArr[last] * rightIncreamentar
            rightIncreamentar *= nums[last]
            last -= 1
        }
        return tempArr
    }
}
