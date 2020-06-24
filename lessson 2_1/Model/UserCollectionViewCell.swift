//
//  UserCollectionViewCell.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 20.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    
    var like:Bool = false
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    

  
    var theLabel: UILabel = {
         let label = UILabel()
         
         label.textColor = UIColor.blue
         label.textAlignment = .left
         label.text = "0"
         return label
     }()

    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .blue
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()
    
    
    func setupViews(){
        

          
        addSubview(theLabel)
        
        theLabel.frame = CGRect(x: 155,y: 172,width: contentView.frame.width - 30,height: 24)
     
        // add a button
        addSubview(likeButton)
        
        likeButton.centerXAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        likeButton.centerYAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        

        
        // add the touchUpInside target
        likeButton.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
    }
    
    @objc func btnTapped() {

        like = !like
 
        theLabel.text = "\(like ? 1 : 0)"

        if like {
        
            theLabel.textColor = .red
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
        } else {
            theLabel.textColor = .blue
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tintColor = .blue
        }
        
        // use our "call back" action to tell the controller the button was tapped
        
    }
    
}

