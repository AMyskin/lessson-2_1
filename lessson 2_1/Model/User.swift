

import UIKit

struct User {
    var name: String
    var image: [UIImage]
    
    var avatar: UIImage? {
        return image.first
    }
    
    
    static let itemsInSections: Array<Array<User>> = [[User(name: "Андрей", image: [UIImage(named: "user1.jpg")!,
                                                                                          UIImage(named: "user1_2.jpeg")!,
                                                                                          UIImage(named: "user1_3.jpeg")!]),
                                                       User(name: "Артур", image: [UIImage(named: "user2.jpeg")!,
                                                                                        UIImage(named: "user2_2.jpeg")!,
                                                                                        UIImage(named: "user2_3.jpeg")!])],
                                                      [User(name: "Борис", image: [UIImage(named: "user3.jpeg")!,
                                                                                        UIImage(named: "user3_2.jpeg")!,
                                                                                        UIImage(named: "user3_3.jpeg")!])],
                                                      
                                                      [User(name: "Влад", image: [UIImage(named: "user3.jpeg")!,
                                                                                      UIImage(named: "user3_2.jpeg")!,
                                                                                      UIImage(named: "user3_3.jpeg")!]),
                                                       User(name: "Владимир", image: [UIImage(named: "user1.jpg")!,
                                                                                              UIImage(named: "user1_2.jpeg")!,
                                                                                              UIImage(named: "user1_3.jpeg")!])],
                                                      [User(name: "Друг", image: [UIImage(named: "user1.jpg")!,
                                                                                      UIImage(named: "user1_2.jpeg")!,
                                                                                      UIImage(named: "user1_3.jpeg")!]),
                                                       User(name: "Даша", image: [UIImage(named: "user1.jpg")!,
                                                                                      UIImage(named: "user1_2.jpeg")!,
                                                                                      UIImage(named: "user1_3.jpeg")!])],
                                                      [User(name: "Яна", image: [UIImage(named: "user2.jpeg")!,
                                                                                            UIImage(named: "user2_2.jpeg")!,
                                                                                            UIImage(named: "user2_3.jpeg")!]),
                                                       User(name: "Янка", image: [UIImage(named: "user1.jpg")!,
                                                                                            UIImage(named: "user1_2.jpeg")!,
                                                                                            UIImage(named: "user1_3.jpeg")!]),
                                                       User(name: "Яся", image: [UIImage(named: "user1.jpg")!,
                                                                                            UIImage(named: "user1_2.jpeg")!,
                                                                                            UIImage(named: "user1_3.jpeg")!]),
                                                       User(name: "Ярина", image: [UIImage(named: "user1.jpg")!,
                                                                                            UIImage(named: "user1_2.jpeg")!,
                                                                                            UIImage(named: "user1_3.jpeg")!]),
                                                       User(name: "Ярослав", image: [UIImage(named: "user3.jpeg")!,
                                                                                            UIImage(named: "user3_2.jpeg")!,
                                                                                            UIImage(named: "user3_3.jpeg")!]),
                                                       User(name: "Ярослава", image: [UIImage(named: "user2.jpeg")!,
                                                                                            UIImage(named: "user2_2.jpeg")!,
                                                                                            UIImage(named: "user2_3.jpeg")!]),
                                                       User(name: "Ярослав", image: [UIImage(named: "user1.jpg")!,
                                                                                            UIImage(named: "user1_2.jpeg")!,
                                                                                            UIImage(named: "user1_3.jpeg")!])]
    ]
    
    static let sections: Array<String> = ["А","Б", "В", "Д","Я"]
    
    
    
    //    static let testData = [User(name: "Друг номер 1", image: [UIImage(named: "user1.jpg")!,
    //                                                UIImage(named: "user1_2.jpeg")!,
    //                                                UIImage(named: "user1_3.jpeg")!]),
    //    User(name: "Второй друг ", image: [UIImage(named: "user2.jpeg")!,
    //                                                 UIImage(named: "user2_2.jpeg")!,
    //                                                 UIImage(named: "user2_3.jpeg")!]),
    //    User(name: "Друг номер 3", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 4", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 5", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 6", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 7", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 8", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 9", image: [UIImage(named: "user3.jpeg")!,
    //                                                UIImage(named: "user3_2.jpeg")!,
    //                                                UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 10", image: [UIImage(named: "user3.jpeg")!,
    //                                                 UIImage(named: "user3_2.jpeg")!,
    //                                                 UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 11", image: [UIImage(named: "user3.jpeg")!,
    //                                                 UIImage(named: "user3_2.jpeg")!,
    //                                                 UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 12", image: [UIImage(named: "user3.jpeg")!,
    //                                                 UIImage(named: "user3_2.jpeg")!,
    //                                                 UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 13", image: [UIImage(named: "user3.jpeg")!,
    //                                                 UIImage(named: "user3_2.jpeg")!,
    //                                                 UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 14", image: [UIImage(named: "user3.jpeg")!,
    //                                                 UIImage(named: "user3_2.jpeg")!,
    //                                                 UIImage(named: "user3_3.jpeg")!]),
    //    User(name: "Друг номер 15", image: [UIImage(named: "user3.jpeg")!,
    //                                                 UIImage(named: "user3_2.jpeg")!,
    //                                                 UIImage(named: "user3_3.jpeg")!])
    //]
    
    
    
    
}
