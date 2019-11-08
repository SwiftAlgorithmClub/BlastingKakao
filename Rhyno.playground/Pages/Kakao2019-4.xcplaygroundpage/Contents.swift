import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {

    var ordered = food_times.enumerated().sorted { $0.element < $1.element }
    let k = Int(k)
    var total = 0
    var index = 0
    var prevTime = 0

    while index < ordered.count {
        let toBeElapsed = (ordered.count - index) * (ordered[index].element - prevTime)

        if total + toBeElapsed <= k{
            total += toBeElapsed

            prevTime = ordered[index].element
            ordered[index].element = 0
            index += 1
        } else {
            let toEat = (k - total) % (ordered.count - index)
            return ordered.filter({ $0.element != 0 }).sorted(by: { $0.offset < $1.offset })[toEat].offset + 1
        }
    }
    return -1
}
