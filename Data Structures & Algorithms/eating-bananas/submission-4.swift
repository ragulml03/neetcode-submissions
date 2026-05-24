class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1
        var right = piles.max() ?? Int.max

        while left < right {
            let mid = left + (right - left) / 2

            var totalCount = 0

            for i in 0..<piles.count {
                let counter = (piles[i] + mid - 1) / mid

                totalCount += counter
            }
            if totalCount > h {
                    left = mid + 1
                } else {
                    right = mid
                }
        }
        return left
    }
}
