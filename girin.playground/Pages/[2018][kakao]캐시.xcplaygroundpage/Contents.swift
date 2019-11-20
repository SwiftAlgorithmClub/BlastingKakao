
import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    // 0 <= cacheSize <= 30
    // cities.count <= 100000
    // 오직 영문
    
    var time = 0
    
    var cache: [String] = []
    
    for city in cities {
    
        if cache.contains(city.lowercased()) {
        
            time = time + 1
                        
        }
        else {
        
            time = time + 5
            
        }
        
        cache.append(city.lowercased())
        
        if cache.count > cacheSize || cache.count > 30 {
            
            cache.remove(at: 0)
            
        }
        
//        print(cache)
        
        
    }

//    print(time)
    
    return time
    
}

//solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"])

solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"])
