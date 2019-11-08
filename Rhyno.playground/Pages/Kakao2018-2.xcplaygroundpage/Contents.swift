//: [Previous](@previous)

import Foundation

func solution(_ dartResult:String) -> Int {
    var points: [Int] = [0, 0, 0]

    var index = 0
    var isNumber = true

    for d in dartResult {
        if d.isNumber {
            if !isNumber {
                index += 1
                isNumber = true
            }
            points[index] = points[index] * 10 + Int(String(d))!
        } else {
            isNumber = false
            if d == Character("D") {
                points[index] *= points[index]
            } else if d == Character("T") {
                points[index] *= points[index] * points[index]
            } else if d == Character("*") {
                if index > 0 {
                    points[index-1] *= 2
                }
                points[index] *= 2
            } else if d == Character("#") {
                points[index] *= -1
            }
        }
    }

    return points[0] + points[1] + points[2] // reduce 쓰면 시간초과
}

solution("1D2S0T")
