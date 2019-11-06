import Foundation


func solution(_ p:String) -> String {

    if p.isEmpty {
        return ""
    }

    let dividePoint = p.index(p.startIndex, offsetBy: getPointToDivide(p))

    let u = String(p[..<dividePoint])
    let v = String(p[dividePoint...])

    if isCorrect(u) {
        return u + solution(v)
    } else {
        var result: String = "("
        result += solution(v)
        result += ")"
        result += trimAndReverse(u)

        return result
    }
}

func isCorrect(_ s: String) -> Bool {
    var st: [Character] = []

    for c in s {
        if c == Character("(") {
            st.append(c)
        } else {
            if st.isEmpty {
                return false
            }

            st.popLast()
        }
    }

    if st.isEmpty {
        return true
    } else {
        return false
    }
}
func getPointToDivide(_ s: String) -> Int {
    var openCount = 0
    var closeCount = 0
    var result = 0
    for c in s {
        if c == Character("(") {
            openCount += 1
        } else {
            closeCount += 1
        }

        result += 1

        if openCount == closeCount {
            return result
        }
    }

    return result
}

func trimAndReverse(_ s: String) -> String {
    var result: String = ""

    let begin = s.index(after: s.startIndex)
    let end = s.index(before: s.endIndex)
    for c in s[begin..<end] {
        if c == Character("(") {
            result += ")"
        } else {
            result += "("
        }
    }

    return result
}
