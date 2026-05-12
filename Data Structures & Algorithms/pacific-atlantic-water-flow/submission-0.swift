class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let rows = heights.count
        let columns = heights[0].count

        var pacific = Array(repeating: Array(repeating: false, count: columns), count: rows)
        var atlantic = Array(repeating: Array(repeating: false, count: columns), count: rows)

        func validatePacificAtlantic(_ mapVals: inout [[Bool]], _ row: Int, _ column: Int, _ lastVal: Int) {
        if row < 0 || row >= heights.count || column < 0 || column >= heights[0].count {
            return
        }
        if mapVals[row][column] == true || heights[row][column] < lastVal {
            return
        }
        mapVals[row][column] = true

        validatePacificAtlantic(&mapVals, row + 1, column, heights[row][column])
        validatePacificAtlantic(&mapVals, row - 1, column, heights[row][column])
        validatePacificAtlantic(&mapVals, row, column + 1, heights[row][column])
        validatePacificAtlantic(&mapVals, row, column - 1, heights[row][column])
    }

        for i in 0..<rows {
            validatePacificAtlantic(&pacific, i, 0, 0)
        }

        for j in 0..<columns {
            validatePacificAtlantic(&pacific, 0, j, 0)
        }

        for i in 0..<rows {
            validatePacificAtlantic(&atlantic, i, (columns - 1), 0)
        }

        for j in 0..<columns {
            validatePacificAtlantic(&atlantic, (rows - 1), j, 0)
        }

        var result: [[Int]] = []
        for i in 0..<rows {
            for j in 0..<columns {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i,j])
                }
            }
        }
        return result
    }
}
