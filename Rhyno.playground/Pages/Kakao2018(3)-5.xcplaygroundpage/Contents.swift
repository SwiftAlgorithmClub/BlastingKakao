import Foundation

func solution(_ words:[String]) -> Int {
    let sorted = words.sorted()
    var result = 0

    let n = sorted.count - 1
    for (i,s) in sorted.enumerated() {
        var needToType:[Int] = []

        if i > 0 {
            needToType.append(s.countSimilarity(sorted[i-1])+1)
        }

        if i < n {
            needToType.append(s.countSimilarity(sorted[i+1])+1)
        }

        result += min(s.count, needToType.max()!)
    }

    return result
}

extension String {
    func countSimilarity(_ str: String) -> Int {

        var selfIndex = self.startIndex
        var strIndex = self.startIndex
        var result = 0

        while selfIndex != self.endIndex && strIndex != str.endIndex && self[selfIndex] == str[strIndex] {
            result += 1
            selfIndex = self.index(after: selfIndex)
            strIndex = str.index(after: strIndex)
        }

        return result
    }
}


solution(["word","war","warrior","world"])
