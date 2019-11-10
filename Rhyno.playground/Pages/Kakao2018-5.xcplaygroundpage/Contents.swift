import Foundation

struct MultiSet {
    var data: [String:Int] = [:]

    init(_ str: String = "") {

        if str.isEmpty {
            return
        }

        var iter = str.makeIterator()

        var prevChar: Character = iter.next()!

        while let nextChar = iter.next() {
            guard prevChar.isLetter, nextChar.isLetter else {
                prevChar = nextChar
                continue
            }

            let element = String([prevChar,nextChar])

            if let c = data[element] {
                data[element] = c + 1
            } else {
                data[element] = 1
            }

            prevChar = nextChar
        }
    }

    func intersection(_ set: MultiSet) -> MultiSet {
        var result: MultiSet = MultiSet()

        for (str,i) in set.data {
            if let element = self.data[str] {
                result.data[str] = min(i, element)
            }
        }

        return result
    }

    func union(_ set: MultiSet) -> MultiSet {
        var result: MultiSet = MultiSet()

        for (str,i) in set.data {
            if let element = self.data[str] {
                result.data[str] = max(i, element)
            } else {
                result.data[str] = i
            }
        }

        for (str, i) in self.data {
            if let element = set.data[str] {
                result.data[str] = max(i, element)
            } else {
                result.data[str] = i
            }
        }

        return result
    }

    var count: Int {
        var result = 0
        for (str,i) in self.data {
            result += i
        }

        return result
    }
}

func solution(_ str1:String, _ str2:String) -> Int {
    let set1 = MultiSet(str1.lowercased())
    let set2 = MultiSet(str2.lowercased())

    let inter = set1.intersection(set2)
    let union = set1.union(set2)

    if union.count == 0 {
        return 65536
    } else {
        return inter.count * 65536 / union.count
    }
}
