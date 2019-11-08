import Foundation


func makeCandidate(_ n: Int ,_ i: Int, _ s: Set<Int>, _ c: @escaping (Set<Int>) -> Void) {
    var s = s
    if i == n {
        c(s)
    } else {
        makeCandidate(n, i+1, s, c)
        s.insert(i)
        makeCandidate(n, i+1, s, c)
    }
}

func solution(_ relation:[[String]]) -> Int {
    var candidate: Set<Set<Int>> = Set()
    var result = 0
    makeCandidate(relation[0].count, 0, Set<Int>()) {
        if $0.isEmpty {
            return
        }

        if relation.checkRedundant($0){
            candidate.insert($0)
        }
    }

    for c in candidate {
        if candidate.isCanBeCandidate(c) {
            result += 1
        }
    }

    return result
}

extension Array where Element == [String] {
    func checkRedundant(_ s: Set<Int>) -> Bool {
        var tuples: Set<[String]> = Set()

        for t in self {
            var temp: [String] = []
            for i in s {
                temp.append(t[i])
            }

            if tuples.contains(temp) {
                return false
            } else {
                tuples.insert(temp)
            }
        }

        return true
    }
}

extension Set where Element == Set<Int> {
    func isCanBeCandidate(_ s: Set<Int>) -> Bool {
        for c in self {
            if s != c, s.isSuperset(of: c){
                return false
            }
        }
        return true
    }
}

solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])
