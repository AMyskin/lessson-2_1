//
//  Group.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 20.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//
import UIKit

struct Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name &&
            lhs.image == rhs.image
    }
    
    let name: String
    let image: UIImage
    
   
    
    static let testGroup: [Group] = [Group(name: "Группа 1", image: UIImage(named: "group1")!),
                            Group(name: "Группа 2", image: UIImage(named: "group2")!),
                            Group(name: "Группа 3", image: UIImage(named: "group3")!),
                            Group(name: "Группа 4", image: UIImage(named: "group1")!),
                            Group(name: "Группа 5", image: UIImage(named: "group2")!),
                            Group(name: "Группа 6", image: UIImage(named: "group3")!)
    ]
    
    
}
