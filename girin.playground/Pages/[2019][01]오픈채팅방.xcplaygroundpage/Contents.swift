//
// 안녕하세요 기린입니다.
//
import Foundation

func solution(_ record:[String]) -> [String] {
       
    var nickNameDict = Dictionary<String, String>()
    
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
        
        for key in nickNameDict.keys {
            
            let str = result[i]
            
            let splitStr = str.split(separator: " ")
            
            let id = splitStr.first
            
            if key == String(id!) {
                
                result[i] = nickNameDict[key]! + splitStr[1] + " " + splitStr[2]
                
                break
                
            }
            
        }
        
    }
    
//    print(result)
    
    return result
    
}


solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])
