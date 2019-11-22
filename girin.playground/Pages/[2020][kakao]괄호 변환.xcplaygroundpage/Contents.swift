
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
        
        return "(" + uu + ")" + String(v)

    }
        
}

//print(solution(")("))

print(solution("()))((()")) // "()(())()"


//1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
//2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
//3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
//  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
//4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
//  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
//  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
//  4-3. ')'를 다시 붙입니다.
//  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
//  4-5. 생성된 문자열을 반환합니다.

// ()))((()
// ""이 아님 -> u,v로 쪼갬
// (), ))((()
// u는 올바른 괄호임 -> v를 u,v로 쪼갬

// ))((, ()
// u는 올바른 괄호가 아님 -> "(" + "()" + ")" ->  앞뒤 제거, 남은거 뒤딮기 -> "(())" + "()"
// -> "(())()"

// -> "()" + "(())()" -> "()(())()"

