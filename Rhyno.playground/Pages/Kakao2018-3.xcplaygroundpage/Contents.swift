import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    var recent: [Int] = []
    var result = 0

    for city in cities {
        let city = city.lowercased()
        if cache.contains(city),
            let index = cache.firstIndex(of: city) {

            recent[index] = result

            result += 1
        } else if cache.count < cacheSize {
            cache.append(city)
            recent.append(result)

            result += 5
        } else {
            if let minimum = recent.min(),
                let index = recent.firstIndex(of: minimum) {

                 cache[index] = city
                 recent[index] = result
            }

            result += 5
        }
    }

    return result
}

solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"])
