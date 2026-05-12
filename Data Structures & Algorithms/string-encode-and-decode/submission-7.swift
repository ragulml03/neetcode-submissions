class Solution {

    func encode(_ strs: [String]) -> String {
        var result = ""
        for char in strs {
           result += "\(char.count)#\(char)"
        }
        return result
    }

    func decode(_ str: String) -> [String] {
        var result: [String] = []
        var i = 0
        let arrStr = Array(str)

        while i < arrStr.count {
            var j = i
            var end = 0

            while j < arrStr.count && arrStr[j] != "#" {
                j += 1
            }

            let totalLength = Int(String(arrStr[i..<j]))!

            i = j + 1

            end = i + totalLength

            let strVal = String(arrStr[i..<end])

            result.append(strVal)

            i = end
        }

        return result
    }
}
