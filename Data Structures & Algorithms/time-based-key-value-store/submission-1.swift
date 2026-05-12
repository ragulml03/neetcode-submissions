class TimeMap {

    struct Entries {
        let value: String
        let timestamp: Int
    }

    var stroies: [String : [Entries]]

    init() {
        stroies = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        stroies[key, default:[]].append(Entries(value: value, timestamp:timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let vall = stroies[key] else { return "" }

        var left = 0
        var right = vall.count - 1
        var result = ""

        while left <= right {
            let mid = left + (right - left) / 2

            let midVal = vall[mid].timestamp

            if midVal <= timestamp {
                result = vall[mid].value
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return result
    }
}
