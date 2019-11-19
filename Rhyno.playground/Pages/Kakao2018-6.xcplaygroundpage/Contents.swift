import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var cBoard: [[Character]] = []

    var needsDelete = true
    var result = 0

    for b in board {
        cBoard.append(Array(b))
    }

    while needsDelete {
        needsDelete = false
        for i in 0..<m {
            for j in 0..<n {
                if cBoard.canDelete(j, i) {
                    needsDelete = true
                    cBoard.checkNeedDelete(j, i)
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if cBoard[i][j].isLowercase {
                    result += 1
                    cBoard.delete(j, i)
                }
            }
        }

        cBoard.deleteBlank()
    }

    return result
}

extension Array where Element == [Character] {

    func canDelete(_ x: Int, _ y: Int) -> Bool {
        guard y < self.count-1, x < self[0].count-1 else {
            return false
        }

        let block1 = self[y][x].uppercased()
        let block2 = self[y][x+1].uppercased()
        let block3 = self[y+1][x].uppercased()
        let block4 = self[y+1][x+1].uppercased()

        return block1 != " " && block1 == block2 && block1 == block3 && block1 == block4
    }

    mutating func checkNeedDelete(_ x: Int, _ y: Int) {
        guard y < self.count-1, x < self[0].count-1 else {
            return
        }

        self[y][x] = Character(self[y][x].lowercased())
        self[y][x+1] = Character(self[y][x+1].lowercased())
        self[y+1][x] = Character(self[y+1][x].lowercased())
        self[y+1][x+1] = Character(self[y+1][x+1].lowercased())
    }

    mutating func delete(_ x: Int, _ y: Int) {
        self[y][x] = " "
    }

    mutating func deleteBlank() {
        let cursorX = self[0].count - 1
        let cursorY = self.count - 1

        for _ in 0..<self.count {
            for i in stride(from: cursorX, to: -1, by: -1) {
                for j in stride(from: cursorY, to: 0, by: -1) {
                    if self[j][i] == " " {
                        let temp = self[j][i]
                        self[j][i] = self[j-1][i]
                        self[j-1][i] = temp
                    }
                }
            }
        }
    }
}

solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])
