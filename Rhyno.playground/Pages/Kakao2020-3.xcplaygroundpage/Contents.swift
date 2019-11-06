//: [Previous](@previous)

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    if lock.isFilled(x: 0, y: 0, size: lock.count) {
        return true
    }

    var k = key
    var l = Array(repeating: Array(repeating: 0,
                                   count: lock.count + 2 * key.count - 2),
        count: lock.count + 2 * key.count - 2)

    for i in 0..<lock.count {
        for j in 0..<lock.count {
            l[i+key.count-1][j+key.count-1] = lock[i][j]
        }
    }

    for i in 0..<l.count - key.count + 1 {
        for j in 0..<l.count - key.count + 1 {
            for _ in 0..<4 {
                if let f = l.overwraped(x: i, y: j, k),
                    f.isFilled(x: key.count - 1, y: key.count - 1, size: lock.count) {
                    return true
                }
                k.rotate()
            }
        }
    }

    return false
}

extension Array where Element == [Int] {
    mutating func rotate() {

        guard !self.isEmpty, self.count == self[0].count else {
            return
        }

        for i in 0..<self.count/2 {
            for j in i..<count-i - 1 {
                var px = j
                var py = i
                var temp = self[py][px]
                for _ in 0..<4 {
                    let nx = count - py - 1
                    let ny = px
                    swap(&temp, &self[ny][nx])

                    px = nx
                    py = ny
                }
            }
        }
    }

    func overwraped(x: Int, y: Int, _ arr: [[Int]]) -> [[Int]]?{
        var result = self

        for i in 0..<arr.count {
            for j in 0..<arr.count{
                if result[i+y][j+x] & arr[i][j] == 1 { // 겹치는 것
                    return nil
                } else {
                    result[i+y][j+x] |= arr[i][j]
                }
            }
        }

        return result
    }

    func isFilled(x: Int, y: Int, size: Int) -> Bool {

        for i in 0..<size {
            for j in 0..<size {
                if self[i+y][j+x] == 0 {
                    return false
                }
            }
        }

        return true
    }
}

solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])
