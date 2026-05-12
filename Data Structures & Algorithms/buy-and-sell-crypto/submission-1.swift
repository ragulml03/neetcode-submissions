class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = prices[0]
        var maxProfit = 0
        for i in 1..<prices.count {
            let currectprice = prices[i]
            if currectprice < minPrice {
                minPrice = currectprice
            }
            maxProfit = max(maxProfit, currectprice - minPrice)
        }
        return maxProfit
    }
}
