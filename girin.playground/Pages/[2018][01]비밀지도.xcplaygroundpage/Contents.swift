//
// 안녕하세요 기린입니다.
//
import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {

    var answer: [String] = []
    
    for i in 0..<n {

        let num1 = decimalTobinary(arr1[i], n)
        
        let num2 = decimalTobinary(arr2[i], n)
        
        let num1Arr = Array(num1)
        
        let num2Arr = Array(num2)
        
        var tempAnswer = ""
        
        for j in 0..<n {

            if num1Arr[j] == "0" && num2Arr[j] == "0" {
                
                tempAnswer = tempAnswer + " "
                
            }
            else{
                
                tempAnswer = tempAnswer + "#"
                
            }
            
        }
        
        answer.append(tempAnswer)
        
    }
    
    return answer
    
}

func decimalTobinary(_ n:Int, _ max:Int) -> (String){

    var binaryStr = ""
    
    var num = n
    
    if n == 1 {
        
        return "00001"
        
    }
    
    while(num > 1) {
    
        binaryStr = String(num % 2) + binaryStr
        
        num = num / 2
        
    }
    
    binaryStr = String(num) + binaryStr

    if binaryStr.count != max {

        for i in 0..<max-binaryStr.count {

            binaryStr = "0" + binaryStr
            
        }
        
    }

    return binaryStr
    
}


print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
