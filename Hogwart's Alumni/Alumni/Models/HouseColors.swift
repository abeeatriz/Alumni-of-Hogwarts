import UIKit

enum House {
    case Gryffindor
    case Ravenclaw
    case Hufflepuff
    case Slytherin

    static func getColor(house:String)->UIColor{
        switch house {
        case "Gryffindor":
            return UIColor.init(named: "MyEasyOnTheEyesRed") ?? .red
        case "Ravenclaw":
            return UIColor.init(named: "MyEasyOnTheEyesBlue") ?? .blue
        case "Hufflepuff":
            return UIColor.init(named: "MyEasyOnTheEyesYellow") ?? .yellow
        case "Slytherin":
            return UIColor.init(named: "MyEasyOnTheEyesGreen") ?? .green
        default:
            return UIColor.white
        }
    }
    
}
