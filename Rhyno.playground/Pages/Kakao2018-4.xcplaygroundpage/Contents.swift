//: [Previous](@previous)

import Foundation

struct Time: Comparable {
    let h: Int
    let m: Int

    static func < (lhs: Time, rhs: Time) -> Bool {
        if lhs.h != rhs.h {
            return lhs.h < rhs.h
        } else {
            return lhs.m < rhs.m
        }
    }

    static func + (lhs: Time, rhs: Time) -> Time {
        let minute = (lhs.m + rhs.m) % 60
        let hour = (lhs.h + rhs.h) + (lhs.m + rhs.m) / 60

        return Time(h: hour, m: minute)
    }

    static func - (lhs: Time, rhs: Time) -> Time {
        let temp = lhs.m - rhs.m
        let minute = temp >= 0 ? temp : 60 + temp
        let hour = lhs.h - rhs.h + (lhs.m - rhs.m >= 0 ? 0 : -1)

        return Time(h: hour, m: minute)
    }

    func toString() -> String {
        if h < 10, m < 10 {
            return "0\(h):0\(m)"
        } else if h < 10 {
            return "0\(h):\(m)"
        } else if m < 10 {
            return "\(h):0\(m)"
        } else {
            return "\(h):\(m)"
        }
    }
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {

    let table = timetable.sorted()
        .map { $0.components(separatedBy: ":")}
        .map { Time(h: Int($0[0])!, m: Int($0[1])!)}


    var busTime = Time(h: 9, m: 0)
    var cursor = 0
    var boarded = 0

    for i in 0..<n {
        boarded = 0

        while boarded < m,
            cursor < table.count,
            table[cursor] <= busTime {
                boarded += 1
                cursor += 1
        }

        busTime = busTime + Time(h: 0, m: t)
    }

    busTime = busTime - Time(h: 0, m: t)
    if boarded < m { // 마지막 버스에 자리가 남았을 경우
        return busTime.toString() // 버스시간에 맞춰서 도착하면 된다.
    } else { // 마지막 버스에 자리가 없을 경우
        return (table[cursor-1] - Time(h:0, m:1)).toString() // 마지막에 탄사람보다 1분 앞서면 된다.
    }
}

solution(2, 1, 2, ["09:00", "09:00", "09:00", "09:00"])
