//
//  UserCell.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 20.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

@IBDesignable class UserCell: UITableViewCell {
    
    var imageRadius: CGFloat = 20
    @IBInspectable var widthShadow: CGFloat = 5 {
        
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowColor: CGColor = UIColor.black.cgColor {
        didSet {
            setNeedsDisplay()
        }
    }


 
    

    @IBOutlet weak var name: UILabel!
    

    @IBOutlet weak var userImage: UIImageView!{
        didSet{
            userImage.backgroundColor = .black
            userImage.layer.cornerRadius = imageRadius
            userImage.layer.masksToBounds = true
            
            userImage.layer.shadowColor = UIColor.black.cgColor
            userImage.layer.shadowOffset = CGSize (width: 5, height: 5)
            userImage.layer.shadowOpacity = 0.8
            userImage.layer.shadowRadius = 5
            
            
               }
    }
    
    
    @IBOutlet weak var avatarView: AvatarView!{
        didSet{

            
            avatarView.layer.cornerRadius = imageRadius;
            avatarView.layer.shadowColor = shadowColor;
            avatarView.layer.shadowOpacity = shadowOpacity;
            avatarView.layer.shadowRadius = widthShadow;
            avatarView.layer.shadowOffset = CGSize (width: 5, height: 5)
            
         
        }
    }
    
    

    
}
