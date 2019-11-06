import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    let combined = zip(arr1,arr2).map { $0 | $1 }

    for i in 0..<n {
        var str = ""

        for j in 0..<n {
            let mask = 1 << (n-j-1)
            if combined[i] & mask > 0 {
                str += "#"
            } else {
                str += " "
            }
        }

        answer.append(str)
    }

    return answer
}
