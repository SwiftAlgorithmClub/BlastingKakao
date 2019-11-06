import Foundation

class Trie {
    var children: [Trie?] = Array(repeating: nil, count: 26)
    var isTerminal: Bool = false
    var lengthDic: [Int:Int] = [:]

    func insert(_ str: String) {
        let chars = Array(str)

        _insert(chars, index: 0)
    }

    func _insert(_ chars: [Character], index: Int = 0) {
        if index == chars.count {
            self.isTerminal = true
            return
        }

        let i = getIndex(chars[index])
        if let c =  self.lengthDic[chars.count - index - 1]  {
            self.lengthDic[chars.count - index - 1] =  c + 1
        } else {
            self.lengthDic[chars.count - index - 1] = 1
        }

        if let next = children[i] {
            next._insert(chars, index: index+1)
        } else {
            children[i] = Trie()
            children[i]!._insert(chars, index: index+1)
        }
    }

    func find(_ str: String) -> Int {
        let chars = Array(str)

        return _find(chars, index: 0)
    }

    func _find(_ chars: [Character], index: Int = 0) -> Int {
        if chars.count == index {
            return self.isTerminal ? 1 : 0
        }

        var result = 0

        if chars[index] == Character("?") {
            if lengthDic[chars.count - index - 1] != nil {
                result += lengthDic[chars.count - index - 1]!
            }
        } else {
            let i = getIndex(chars[index])

            if let next = children[i] {
                result += next._find(chars, index: index+1)
            }
        }

        return result
    }

    func getIndex(_ c: Character) -> Int {
        return Int(c.asciiValue! - Character("a").asciiValue!)
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {

    let originTrie = Trie()
    let reverseTrie = Trie()

    var result: [Int] = []

    for w in words {
        originTrie._insert(Array(w))
        reverseTrie._insert(w.reversed())
    }

    for q in queries {
        if let firstCh = q.first,
            firstCh != Character("?") { // 접두사
            result.append(originTrie._find(Array(q)))
        } else {
            result.append(reverseTrie._find(q.reversed()))
        }
    }

    return result
}

