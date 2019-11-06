func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var result = [String]()
    for i in 0..<n {
        let num = arr1[i] | arr2[i]
        let bitStrng = String(num, radix: 2)

        var lineBit = ""
        
        var prefix = min(bitStrng.count, n)
        
        while prefix < n {
            lineBit += " "
            prefix += 1
        }
        for bit in bitStrng {
            lineBit += bit == "1" ? "#" : " "
        }
        result.append(lineBit)
    }
    return result
}

//solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])
/*
 [
     "#####",
     "# # #",
     "### #",
     "# ##",
     "#####"
 ]
 */


solution(6, [46, 33, 33, 22, 31, 50], [27, 56, 19, 14, 14, 10])
/*
 [
     "######",
     "###  #",
     "##  ##",
     " #### ",
     " #####",
     "### # "
 ]
 */
