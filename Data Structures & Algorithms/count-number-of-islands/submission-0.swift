class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var myGrid = grid
        var noOfIslanda = 0

        let row = myGrid.count
        if row == 0 { return 0 }
        let column = myGrid[0].count 
        for i in 0..<row {
            for j in 0..<column {
                if myGrid[i][j] == "1" {
                    noOfIslanda += 1
                    validateIsland(grid: &myGrid, row:i ,column:j)
                }
            }
        }
        return noOfIslanda
    }

    func validateIsland(grid: inout [[Character]], row: Int, column: Int) {
        if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count || grid[row][column] == "0" {
            return
        }
        grid[row][column] = "0"

        validateIsland(grid: &grid, row:row + 1 ,column:column)
        validateIsland(grid: &grid, row:row - 1 ,column:column)
        validateIsland(grid: &grid, row:row ,column:column + 1)
        validateIsland(grid: &grid, row:row ,column:column - 1)
    }
}
