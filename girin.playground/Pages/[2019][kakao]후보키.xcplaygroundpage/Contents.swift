
import Foundation

func solution(_ relation:[[String]]) -> Int {
    
    print(relation)
    
    
    
    
    
    return 0
    
}

func isEqualToArray(_ a:[String], _ b:[String]) -> Bool {

    if a.count == b.count {
    
        for i in 0..<a.count {
            
            if a[i] != b[i] {
                
                return false
            }
            
        }
        
        return true
        
    }
    
    return false
    
}


solution([["100", "ryan", "music", "2"], ["200", "apeach", "math", "2"], ["300", "tube", "computer", "3"], ["400", "con", "computer", "4"], ["500", "muzi", "music", "3"], ["600", "apeach", "music", "2"]])


