import Foundation

struct File {
    let head: String
    let numberStr: String
    let number: Int
    let tail: String
    let order: Int

    init? (_ fileName: String, withOrder order: Int) {
        guard let parsed = fileName.parse() else {
            return nil
        }

        self.head = parsed.0
        self.numberStr = parsed.1
        self.number = parsed.2
        self.tail = parsed.3
        self.order = order
    }
}

extension File: Comparable {
    static func < (_ a:File, _ b: File) -> Bool {
        let al = a.head.lowercased()
        let bl = b.head.lowercased()
        if  al != bl {
            return al < bl
        } else if a.number != b.number {
            return a.number < b.number
        } else {
            return a.order < b.order
        }
    }
}

extension File: CustomStringConvertible {
    var description: String {
        return "\(self.head)\(self.numberStr)\(self.tail)"
    }
}

func solution(_ files:[String]) -> [String] {
    let sorted = files
        .enumerated()
        .compactMap{ File($0.element, withOrder: $0.offset) }
        .sorted()
        .map{ "\($0)" }

    return sorted
}

extension String {
    func parse() -> (String, String, Int, String)? {

        var str: [String] = Array(repeating: "", count: 3)
        var index = 0

        var it = self.makeIterator()

        while let c = it.next() {
            if c.isNumber {
                index += 1
                str[index].append(c)
                while let cc = it.next(){
                    if cc.isNumber{
                        str[index].append(cc)
                    } else {
                        index += 1
                        str[index].append(cc)
                        while let ccc = it.next() {
                            str[index].append(ccc)
                        }
                    }
                }
            } else {
                str[index].append(c)
            }
        }

        guard let number = Int(str[1]) else {
            return nil
        }
        return (str[0], str[1], number, str[2])
    }
}

solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
