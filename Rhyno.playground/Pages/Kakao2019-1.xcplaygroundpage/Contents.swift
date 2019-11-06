//: [Previous](@previous)

import Foundation

func solution(_ record:[String]) -> [String] {
    var userList: [String: String] = [:]

    var result: [String] = []
    var log:[(String, String)] = []
    for r in record {
        let s = r.components(separatedBy: .whitespaces)

        switch s[0] {
        case "Enter":
            userList[s[1]] = s[2]
            log.append((s[0],s[1]))
        case "Leave":
            log.append((s[0],s[1]))
        case "Change":
            userList[s[1]] = s[2]
        default:
            break
        }
    }

    for l in log {
        switch l.0 {
        case "Enter":
            result.append("\(userList[l.1]!)님이 들어왔습니다.")
        case "Leave":
            result.append("\(userList[l.1]!)님이 나갔습니다.")
        default:
            break
        }
    }
    return result
}
