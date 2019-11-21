
import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var a: [Float] = []
    
    var b: [Float] = []
    
    for _ in 0...N+1 {
        
        a.append(0)
        
        b.append(0)
        
    }
    
    for stage in stages {
        
        for i in 1...stage {
            
            b[i] = b[i] + 1
            
            
            if i == stage {
                
                a[i] = a[i] + 1
                
            }
        }
        
    }
    
    var 번호배열: [Int] = []
     
    var 실패율배열: [Float] = []

    for i in 1...N {
        
        let 실패율 = a[i] / b[i]
        
        번호배열.append(i)
        
        실패율배열.append(실패율)
        
    }
    
    for i in 0..<번호배열.count - 1 {
    
        for j in i+1..<번호배열.count{
        
            if 실패율배열[i] < 실패율배열[j] {
                
                let 임시실패율 = 실패율배열[i]
                
                실패율배열[i] = 실패율배열[j]
                
                실패율배열[j] = 임시실패율
                
                let 임시번호 = 번호배열[i]
                
                번호배열[i] = 번호배열[j]
                
                번호배열[j] = 임시번호
                
            }
            else if 실패율배열[i] == 실패율배열[j] {
            
                if 번호배열[i] > 번호배열[j]  {
                    
                    let 임시실패율 = 실패율배열[i]
                    
                    실패율배열[i] = 실패율배열[j]
                    
                    실패율배열[j] = 임시실패율
                    
                    let 임시번호 = 번호배열[i]
                    
                    번호배열[i] = 번호배열[j]
                    
                    번호배열[j] = 임시번호
                    
                }
                
                
            }
            
        }
        
    }
    
//    print(번호배열)
    
//    print(실패율배열)

    return 번호배열
    
}

solution(5, [2,1,2,6,2,4,3,3]) // [3,4,2,1,5]
solution(4, [4,4,4,4,4]) // [4,1,2,3]
