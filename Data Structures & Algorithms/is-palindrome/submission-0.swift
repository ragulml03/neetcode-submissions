class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let arrS = Array(s.lowercased())
        var left = 0
        var right = arrS.count - 1

        while left < right {
            if !arrS[left].isLetter && !arrS[left].isNumber {
                left += 1
                continue
            } else if !arrS[right].isLetter && !arrS[right].isNumber {
                right -= 1
                continue
            } else if arrS[left] != arrS[right] {
                return false
            }

            left += 1
            right -= 1
        }
        return true
    }
}
