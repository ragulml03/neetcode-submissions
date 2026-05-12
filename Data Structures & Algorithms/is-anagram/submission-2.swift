class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        var sDict: [Character : Int] = [:]
        for char in s {
            sDict[char, default: 0] += 1
        }

        for char in t {
            if let count = sDict[char] {
                sDict[char]! -= 1
                if sDict[char] == 0 {
                    sDict.removeValue(forKey:char)
                }
            } else {
                return false
            }
        }
        
        return sDict.isEmpty
    }
}
