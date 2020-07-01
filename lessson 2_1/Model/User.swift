

import UIKit

public struct User {
    var name: String
    var image: [UIImage]
    
    var avatar: UIImage? {
        return image.first
        
    }
    
    
    static let friendsTotal = (1...50)
        .map({ _ in Lorem.fullNameUser })
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
    
    

}

extension User : Comparable {
 
    

    


   
    
    public static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name 
    }
    
 
    
}
