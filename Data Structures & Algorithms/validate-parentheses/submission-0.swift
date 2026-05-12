class Solution {
    func isValid(_ s: String) -> Bool {
        var stackArr: [Character] = []
        var bluePrint: [Character : Character] = [
        "}" : "{",
        "]" : "[",
        ")" : "("
    ]
    for char in s {
        if let match = bluePrint[char] {
            let poppedOne = stackArr.popLast()
            if poppedOne != match {
                return false
            }
        } else {
            stackArr.append(char)
        }
    }
    return stackArr.isEmpty
    }
}
