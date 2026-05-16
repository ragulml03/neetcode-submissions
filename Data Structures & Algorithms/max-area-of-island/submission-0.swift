class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var result = 0
    
    var row = grid.count
    if row == 0 { return 0 }
    var column = grid[0].count
    
    var mainGrid = grid
    
    for i in 0..<row {
        for j in 0..<column {
            if mainGrid[i][j] == 1 {
                let getVal = validateMaxNoIsland(grid: &mainGrid, row: i, column: j)
                result = max(result, getVal)
            }
        }
    }
    
    return result
    }

    func validateMaxNoIsland(grid: inout [[Int]], row: Int, column: Int) -> Int {
    if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count || grid[row][column] == 0 {
        return 0
    }
    grid[row][column] = 0
    
    let one = validateMaxNoIsland(grid: &grid, row: row + 1, column: column)
    let two = validateMaxNoIsland(grid: &grid, row: row - 1, column: column)
    let three = validateMaxNoIsland(grid: &grid, row: row, column: column + 1)
    let four = validateMaxNoIsland(grid: &grid, row: row, column: column - 1)
    
    return one + two + three + four + 1
}
}
