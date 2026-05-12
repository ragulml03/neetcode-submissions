class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty { return false }
        let row = matrix.count
        let column = matrix[0].count

        var left = 0
        var right = (row * column) - 1

        while left <= right {

            let mid = left + (right - left) / 2
            let tempRow = mid / column
            let tempColumn = mid % column

            let midVal = matrix[tempRow][tempColumn]

            if midVal == target {
                return true
            } else if midVal < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}
