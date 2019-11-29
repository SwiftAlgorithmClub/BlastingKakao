
import Foundation

//비트 마스크를 이용한 방법
//부분집합은 2진수로 보면 된다.
func powerSetIndexArray(_ n:Int) -> Array<Array<Int>>{
    
    var indexArr: Array<Int> = Array<Int>()
    
    for i in 0..<n {
        
        indexArr.append(i)
        
    }
    
    var resultArray: Array<Array<Int>> = Array<Array<Int>>()
    
    for i in 1..<1<<n {
        //i => 1 ~ (n^2 - 1)
        
        var subArray: Array<Int> = Array<Int>()
        
        for j in 0..<n {
            //원소 개수만큼 조합을 만듬
            
            //j => 0 ~ (n - 1)
            
            if (i & 1<<j) != 0 {
                //1에 해당 하는 부분
                
                subArray.append(j)
                
            }
            
        }
        
        resultArray.append(subArray)
        
    }
    
    return resultArray
    
}

func solution(_ relation:[[String]]) -> Int {

    if relation.isEmpty {
        
        return 0
        
    }
    
    let staticCount = relation.first!.count
    
    var uniqeIndexArray: Array<Array<Int>> = Array<Array<Int>>()
    
    let indexArray:Array<Array<Int>> = powerSetIndexArray(staticCount)
        
    for subArray in indexArray {
    
        var newArray: [[String]] = []
        
        for array in relation {
            
            var tempArray: [String] = []
            
            for index in subArray {
                
                tempArray.append(array[index])
                
            }
            
            
            if !newArray.contains(tempArray) {
                
                newArray.append(tempArray)
                
            }
            
        }

        if newArray.count == relation.count {
            
            uniqeIndexArray.append(subArray)
            
        }
        
    }
    
    print(uniqeIndexArray)
    
    //최소성 판별을 해야함.
    var subSet: Set<Array<Int>> = Set<Array<Int>>()
    
    for array in uniqeIndexArray {
        
        print(array)
        
        subSet.insert(array)
        
    }
    
    print(subSet)
    
    
    return uniqeIndexArray.count
    
}

print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))




