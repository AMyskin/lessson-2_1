//
//  newsOfUser.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 01.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

public struct NewsOfUser: Equatable {
    var image: [UIImage]
    var userDate : NSDate
    var newsTest : String
    
    public static func == (lhs: NewsOfUser, rhs: NewsOfUser) -> Bool {
            return lhs.newsTest == rhs.newsTest && lhs.userDate == rhs.userDate
       }
}
