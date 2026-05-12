class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let arrS1 = Array(s1)
        let arrS2 = Array(s2)
        var dict1: [Character : Int] = [:]
        var window: [Character : Int] = [:]
        var left = 0
        for i in 0..<arrS1.count {
            dict1[arrS1[i], default:0] += 1
        }
        for right in 0..<arrS2.count {
            let rightChar = arrS2[right]
            window[rightChar, default:0] += 1
            if right - left + 1 > arrS1.count {
                let leftChar = arrS2[left]
                window[leftChar]! -= 1
                if window[leftChar] == 0 {
                    window.removeValue(forKey: leftChar)
                }
                left += 1
            }

            if right - left + 1 == arrS1.count {
                if dict1 == window {
                    return true
                }
            }
        }
        return false
    }
}
