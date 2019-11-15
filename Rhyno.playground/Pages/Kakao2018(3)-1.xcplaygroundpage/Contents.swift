import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var numbers: String = ""
    var currentNumber = 0
    var limit = t * m

    while limit > 0 {
        let c = currentNumber.getDigitString(withDigit: n)
        numbers += currentNumber.getDigitString(withDigit: n)
        currentNumber += 1
        limit -= c.count
    }

    var ind = p-1
    var result = ""

    while ind < numbers.count, result.count < t {
        let i = numbers.index(numbers.startIndex, offsetBy: ind)
        result.append(numbers[i])
        ind += m
    }

    return result
}

extension Int {
    func getDigitString(withDigit digit: Int) -> String {
        let d: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D","E","F"]

        var num = self
        var result = ""

        repeat {
            result.append(d[num%digit])
            num /= digit
        } while num > 0

        return String(result.reversed())
    }
}

solution(16, 16, 2, 1)
