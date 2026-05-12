class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let arrStr = Array(s)
        var left = 0
        var maxFrequency = 0
        var maxlength = 0
        var noteBook: [Character : Int] = [:]
        for right in 0..<arrStr.count {
            let rightChar = arrStr[right]
            noteBook[rightChar, default: 0] += 1

            maxFrequency = max(maxFrequency, noteBook[rightChar]!)

            while (right - left + 1) - maxFrequency > k {
                let leftChar = arrStr[left]
                noteBook[leftChar]! -= 1
                left += 1
            }
            maxlength = max(maxlength, right - left + 1)
        }
        return maxlength
    }
}
