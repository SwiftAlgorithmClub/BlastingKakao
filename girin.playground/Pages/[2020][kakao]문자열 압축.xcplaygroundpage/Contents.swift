
import Foundation

func solution(_ s:String) -> Int {

    if s.count < 1 {
        return 0
    }
    else if s.count == 1 {
        return 1
    }
    else if s.count > 1000 {
        return 0
    }

    var min = s.count

    for i in 1...s.count/2 {
 
        var result = ""

        let arr = Array(s)
        
        var n_arr = Array<String>()
        
        var j = 0
        
        while(j+i < arr.count) {
        
            n_arr.append(String(arr[j..<j+i]))
      
            j = j + i
            
            if j+i >= arr.count {
                
                n_arr.append(String(arr[j..<arr.count]))
                
            }
        
        }
        
//        print(n_arr)
        
        var q = 0
        
        var w = 0
        
        while( q < n_arr.count - 1 ) {
            
            var count = 1
            
            w = q
            
            while(w < n_arr.count) {
            
                w = w + 1
                
                if w >= n_arr.count {
                 
                    result = result + String(count) + n_arr[q]
                    
                    q = q + count - 1
                    
                    break
                    
                }
                    
                let first_str = n_arr[q]
                
                let second_str = n_arr[w]
                             
                if first_str == second_str {
                
                    count = count + 1
                    
                }
                else {
                
                    if count == 1 {
                        
                        result = result + first_str
                        
                    }
                    else{
                     
                        result = result + String(count) + first_str
                        
                    }
                    
                    q = q + count - 1
                    
                    break
                    
                }
                
            }
   
            q = q + 1
            
        }
            
        for e in w..<n_arr.count {
            
            result = result + n_arr[e]
            
        }

//        print(result)
        
        if min > result.count {

            min = result.count

        }
        
    }

    return min

}

print(solution("aabbaccc"))
