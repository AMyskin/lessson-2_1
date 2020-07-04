

import UIKit

public struct User {
    var name: String
    var image: [UIImage]
    var newsTest : [NewsOfUser]
    var avatar: UIImage? {
        return image.first
    }
    
    
    
    
    static let friendsTotal = (1...50)
        .map({ _ in fullNameUser })
        .sorted()
    
    static var sectionsOfFriends  =
        Array(
            Set(
                friendsTotal.map ({
                    String($0.name.prefix(1)).uppercased()
                })
            )
        ).sorted()
    
    
    
    
    
    
    static var arrayOfFriends:  Array<Array<User>>
    {
        var tmp:Array<Array<User>> = []
        
        for section in sectionsOfFriends {
            let letter: String = section
            tmp.append(friendsTotal.filter { $0.name.hasPrefix(letter) })
        }
        return tmp
        
    }
    
    static func generateRandomDate(daysBack : Int) -> String{
        //let daysBack = 100
        let day = arc4random_uniform(UInt32(daysBack))+1
        let hour = arc4random_uniform(23)
        let minute = arc4random_uniform(59)
        
        let today = Date(timeIntervalSinceNow: 0)
        let gregorian  = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        var offsetComponents = DateComponents()
        offsetComponents.day = -1 * Int(day - 1)
        offsetComponents.hour = -1 * Int(hour)
        offsetComponents.minute = -1 * Int(minute)
        
        guard let randomDate = gregorian?.date(byAdding: offsetComponents, to: today, options: .init(rawValue: 0) ) else {return "01-01-1900"}
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd-MM-YYYY"
        let mydate = formatter.string(from: randomDate)
        
        
        return mydate
    }
    

    
    
    public static var fullNameUser: User {
        
        let userName = "\(Lorem.firstName) \(Lorem.lastName)"
        
        
        let userImsages: [UIImage] = (1...Int.random(in: 5...10))
            .map { $0 % 6 }
            .shuffled()
            .compactMap({ String($0) })
            .compactMap({ UIImage(named: $0) })
        
        let  newsTest: [NewsOfUser] = (1...Int.random(in: 5...10)).map { _ in
    
            
            return NewsOfUser(
                author: Lorem.fullName,
                avatar: userImsages.first,
                image: (1...Int.random(in: 5...10))
                    .map { $0 % 6 }
                    .shuffled()
                    .compactMap({ String($0) })
                    .compactMap({ UIImage(named: $0) }),
                userDate: generateRandomDate(daysBack: 365),
                
                newsTest: Lorem.sentences(Int.random(in: 2...5)),
                countOfViews: Int.random(in: 100...900),
                countOfLike: Int.random(in: 5...30),
                isLiked: false
            )
        }
        return  User(name: userName,
                     image: userImsages,newsTest: newsTest)
        
    }
    
    
    
    
}






extension User : Comparable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return (lhs.name == rhs.name) && (lhs.newsTest == rhs.newsTest)
    }
    
    
    
    
    public static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name 
    }
    
    
    
}
