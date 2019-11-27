
import Foundation

// 재도전이며, 풀기 앞서 시간에 대한 예외처리를 최대한 줄이는 방법을 생각해보면, 시간을 분으로 표기하는 방법이 답이다.
// 콘 특징 : 게으름, 그래서 가장 늦게 회사에 셔틀타고 도착하고파함.

func toMin(_ time: String) -> Int {

    // 규칙 time은 HH:MM 형식
    
    let timeArr = time.split(separator: ":")
    
    let hour: Int = Int(String(timeArr[0]))!
    
    let min: Int = Int(String(timeArr[1]))!
    
    return min + hour * 60
    
}

func toString(_ min: Int) -> String {

    // 규칙 time은 HH:MM 형식
    
    let hour = min / 60
    
    let newMin = min % 60
    
    return String(format: "%02d", hour) + ":" + String(format: "%02d", newMin)
    
    
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    //생각을 해보자..
    
    //콘의 관점에서 보면 마지막 셔틀버스가 몇시인지가 중요함.
    
    //마지막 셔틀버스가 자리가 있냐 없냐고 보자.
    
    //있다. -> 셔틀버스 시간에 딱맞게 탐.
    
    //없다. -> 셔틀버스를 마지막에 타는 크루보다 1분 일찍 탐. ㅁㅊ놈임
    
    print(timetable)
    
    var memberArr: Array<Int> = Array<Int>()
    
    for time in timetable {
    
        let min = toMin(time)
        
        memberArr.append(min)
        
    }
    
    memberArr.sort()
    
    print(memberArr)
    
    // 마지막 버스의 시간을 구해보자
    
    // n은 배차횟수, t는 배차간격, m은 명수 제한.
    
    var resultTime = 0
    
    var totalCrews = 0
    
    var startTime = toMin("09:00")

    for i in 0..<n {
        
        var maxCrews = m

        print(startTime)
        
        for j in totalCrews..<memberArr.count {
                    
            if memberArr[j] <= startTime {
            
                maxCrews = maxCrews - 1
                
                totalCrews = totalCrews + 1
                
                //탑승완료
                if maxCrews == 0 {
                    
                    print("\(startTime) 탑승완료")
                    
                    break
                    
                }
                
            }
            
        }
        
        
        if i == n-1 {
            //막차인 경우
            
            if maxCrews == 0 {
                //자리가 없다. -> 1분 일찍오기 편법 써야함.
                resultTime = memberArr[totalCrews - 1] - 1
                
            }
            else{
                //자리가 있다. -> 탑승시간 맞춰 탑승
                resultTime = startTime
                
            }
            
        }
        
        startTime = startTime + t
        
    }

    return toString(resultTime)
    
}

//solution(1,1,5,["08:00", "08:01", "08:02", "08:03"])
solution(2,10,2,["09:10", "09:09", "08:00"])
//solution(2,1,2,["09:00", "09:00", "09:00", "09:00"])
//solution(1,1,5,["00:01", "00:01", "00:01", "00:01", "00:01"])
//solution(1,1,1,["23:59"])
//9시부터 2번 운행하며, 10분 간격으로 셔틀이 오고 최대 2명 탈 수 있다.
//버스 운행 시간 부터 구함. -> 9:00버스 9:10버스
