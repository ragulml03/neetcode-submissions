class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var left = 0
        var maxLength = 0
        let arr = Array(s)
        var tracker = [Character : Int]()
        for right in 0..<arr.count {
            let charr = arr[right]
            if let initialIndex = tracker[charr] {
                left = max(left, initialIndex + 1)
            }
            tracker[charr] = right
            
            if right - left + 1 > maxLength {
                maxLength = right - left + 1
            }
        }
        return maxLength
    }
}
