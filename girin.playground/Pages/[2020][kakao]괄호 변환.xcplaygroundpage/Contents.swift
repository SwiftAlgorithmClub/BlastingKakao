
import Foundation

func solution(_ p:String) -> String {
    
    var leftBracket: [Character] = []
    var rightBracket: [Character] = []
    var count = 0
    
    if p == "" {
        
        return ""
        
    }
    
    for c in p {
        
        if c == "(" {
            
            leftBracket.append(c)
            
            count = count + 1
            
        }
        else if c == ")" {
            
            rightBracket.append(c)
            
            count = count + 1
            
        }
        
        if leftBracket.count == rightBracket.count {
            
            break
            
        }
        
    }
    
    let index = p.index(p.startIndex, offsetBy: count)
    var u = p[..<index]
    let v = p[index...]
    
    print("u -> \(u), v -> \(v)")
    
    var intStack = 0
    
    for c in String(u) {
        
        if c == "(" {
            
            intStack = intStack + 1
            
        }
        else if c == ")" {
            
            if intStack > 0 {
                
                intStack = intStack - 1
            }
            
        }
    }
    
    if intStack == 0 {
        //올바른 괄호
        return u + solution(String(v))
        
    }
    else {
        //균형잡힌 괄호
        u.removeFirst()
        u.removeLast()
        
        var uu = ""
        
        for c in String(u) {
            
            if c == "(" {
                
                uu = uu + ")"
                
            }
            else if c == ")" {
                
                uu = uu + "("
                
            }
            
        }
        
        return "(" + solution(String(v)) + ")" + uu

    }
        
}

print(solution(")()()()(")) // "(((())))"


