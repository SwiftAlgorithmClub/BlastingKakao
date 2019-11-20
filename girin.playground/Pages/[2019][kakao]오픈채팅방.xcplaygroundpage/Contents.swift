
import Foundation

func solution(_ record:[String]) -> [String] {
       
    var nickNameDict:[String: String] = [:]
    
    var result:[String] = []

//    print(record)
    
    for i in 0..<record.count {
    
        let str = record[i]
        
        let splitStr = str.split(separator: " ")
        
        if str.hasPrefix("Enter") {
 
            result.append(splitStr[1] + " 님이 들어왔습니다.")
            
            nickNameDict.updateValue(String(splitStr[2]), forKey: String(splitStr[1]))
            
        }
        else if str.hasPrefix("Leave") {
            
            result.append(splitStr[1] + " 님이 나갔습니다.")
            
        }
        else if str.hasPrefix("Change") {
                    
            nickNameDict.updateValue(String(splitStr[2]), forKey: String(splitStr[1]))
            
        }
        
    }
    
//    print(tempResult)
    
    for i in 0..<result.count {
        
        let str = result[i]
        
        let splitStr = str.split(separator: " ")
        
        let id = splitStr[0]
        
        result[i] = nickNameDict[String(id)]! + splitStr[1] + " " + splitStr[2]
        
    }
    
//    print(result)
    
    return result
    
}


solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
