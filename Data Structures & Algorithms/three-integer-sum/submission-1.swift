class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var result: [[Int]] = []
        var sortedNum = nums.sorted()

        for i in 0..<sortedNum.count {
            if i > 0 && sortedNum[i] == sortedNum[i-1] {
                continue
            }

            var left = i + 1
            var right = sortedNum.count - 1
            while left < right {
                let sum = sortedNum[i] + sortedNum[left] + sortedNum[right]

                if sum == 0 {
                    let tempRes = [sortedNum[i], sortedNum[left], sortedNum[right]]
                    result.append(tempRes)
                    left += 1
                    while left < right && sortedNum[left] == sortedNum[left-1] {
                        left += 1
                    }
                } else if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                }
            }
        }
        return result
    }
}
