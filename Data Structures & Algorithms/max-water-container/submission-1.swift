class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1
        var result = 0

        while left < right {
            let width = right - left
            let height = min(heights[left], heights[right])

            let area = width * height

            result = max(result, area)

            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
}
