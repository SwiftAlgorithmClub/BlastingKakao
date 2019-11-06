import Foundation

func solution(_ s:String) -> Int {
    if s.count < 2 {
        return s.count
    }

    var result = s.count

    let ch: [Character] = Array(s)
    let maxPiece = ch.count / 2

    for i in 1 ... maxPiece {
        var length = 0
        var j = 0

        while j < ch.count {
            let last = j+i < s.count ? j+i: s.count

            let current = ch[j..<last]
            var count = 1

            while j + i < s.count {
                let tempLast = j+2*i < s.count ? j+2*i : s.count

                if current == ch[j+i..<tempLast] {
                    count += 1
                    j += i
                } else {
                    break
                }
            }

            var digit = 0

            if count != 1 {
                while count > 0 {
                    digit += 1
                    count /= 10
                }
            }

            length += current.count + digit
            j += i
        }

        result = min(result, length)
    }
    return result
}
