class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var rows = grid.count
        guard rows > 0 else { return -1 }
        var columns = grid[0].count
        var mainGrid = grid

        var queue = [(r: Int, c: Int)]()
        var freshFuritsCount = 0

        for i in 0..<rows {
            for j in 0..<columns {
                if mainGrid[i][j] == 2 {
                    queue.append((r:i, c:j))
                } else if mainGrid[i][j] == 1 {
                    freshFuritsCount += 1
                }
            }
        }
        if freshFuritsCount == 0 { return 0 }

        var head = 0
        var minutesElapsed = 0

        var direction = [(1,0), (-1,0), (0,1), (0,-1)]

        while head < queue.count {
            let queueCountWithHead = queue.count - head
            var didTimeGetUpdated = false

            for _ in 0..<queueCountWithHead{
                let current = queue[head]
                head += 1

                for dir in direction {
                    let nextRow = current.r + dir.0
                    let nextColumn = current.c + dir.1

                    if nextRow >= 0 && nextRow < rows && nextColumn >= 0 && nextColumn < columns && mainGrid[nextRow][nextColumn] == 1 {
                        
                        mainGrid[nextRow][nextColumn] = 2
                        didTimeGetUpdated = true
                        freshFuritsCount -= 1

                        queue.append((r:nextRow, c:nextColumn))
                    }
                }
            }

            if didTimeGetUpdated {
                minutesElapsed += 1
            }
        }

        return freshFuritsCount == 0 ?  minutesElapsed : -1
    }
}
