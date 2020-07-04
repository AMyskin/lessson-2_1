//
//  newsOfUser.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 01.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

public struct NewsOfUser: Equatable {
    var author: String
    var avatar: UIImage? 
    var image: [UIImage]
    var userDate : String
    var newsTest : String
    var countOfViews : Int
    var countOfLike : Int
    var isLiked : Bool
    
    public static func == (lhs: NewsOfUser, rhs: NewsOfUser) -> Bool {
        return lhs.newsTest == rhs.newsTest
            && lhs.userDate == rhs.userDate
            && lhs.countOfViews == rhs.countOfViews
            && lhs.countOfLike == rhs.countOfLike
            && lhs.image == rhs.image
            && lhs.author == rhs.author
            && lhs.isLiked == rhs.isLiked
         && lhs.avatar == rhs.avatar
    }
}
