
enum ChatEntrance {
    case enter
    case leave
}
struct ChatAction {
    let uid: String
    let entrance: ChatEntrance
}

func solution(_ record: [String]) -> [String] {
    var hash = [String:String]()
    var queue = [ChatAction]()
    for r in record {
        let messages = r.split(separator: " ")
        let action = String(messages[0])
        let uid = String(messages[1])
        
        var nickName = ""
        if messages.count == 3 {
            nickName = String(messages[2])
        }

        switch action {
        case "Enter":
            hash.updateValue(nickName, forKey: uid)
            queue.append(ChatAction(uid: uid, entrance: .enter))
        case "Leave":
            queue.append(ChatAction(uid: uid, entrance: .leave))
        case "Change":
            hash.updateValue(nickName, forKey: uid)
        default:
            continue
        }
    }
    
    var result = [String]()
    
    for e in queue {
        guard let nick = hash[e.uid] else {
            continue
        }
        switch e.entrance {
        case .enter:
            result.append("\(nick)님이 들어왔습니다.")
        case .leave:
            result.append("\(nick)님이 나갔습니다.")
        }
    }
    return result
}

solution(
    ["Enter uid1234 Muzi",
        "Enter uid4567 Prodo",
        "Leave uid1234",
        "Enter uid1234 Prodo",
        "Change uid4567 Ryan"]
)


