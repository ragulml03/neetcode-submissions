class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var result = 0
        for num in numSet {
            if !numSet.contains(num - 1) {

                var numHere = num
                var increamenter = 1

                while numSet.contains(numHere + 1) {
                    numHere += 1
                    increamenter += 1
                }
            result = max(result, increamenter)
            }
        }
        return result
    }
}
