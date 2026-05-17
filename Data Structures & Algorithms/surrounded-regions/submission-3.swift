class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        guard rows > 0 else { return }
        let columns = board[0].count

        func validateSUrrounded(board: inout [[Character]], row: Int, column: Int) {
            if row < 0 || row >= board.count || column < 0 || column >= board[0].count || board[row][column] != "O" {
                return
            }

            board[row][column] = "T"

            validateSUrrounded(board: &board, row: row + 1,column: column)
            validateSUrrounded(board: &board, row: row - 1,column: column)
            validateSUrrounded(board: &board, row: row,column: column + 1)
            validateSUrrounded(board: &board, row: row,column: column - 1)
        }

        for i in 0..<rows {
            validateSUrrounded(board: &board, row: i,column: 0)
        }
        for j in 0..<columns {
            validateSUrrounded(board: &board, row: 0,column: j)
        }

        for i in 0..<rows {
            validateSUrrounded(board: &board, row: i,column: columns - 1)
        }
        for j in 0..<columns {
            validateSUrrounded(board: &board, row: rows - 1,column: j)
        }

        for i in 0..<rows {
            for j in 0..<columns {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "T" {
                    board[i][j] = "O"
                }
            }
        }
}
}
