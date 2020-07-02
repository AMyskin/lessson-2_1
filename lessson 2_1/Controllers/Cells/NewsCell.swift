//
//  NewsCell.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 01.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

protocol NewsDelegate: class {
    func errorFunc()
    func likeNews(isLiked: Bool)
    func buttonTapped(cell: NewsCell)
}

class NewsCell: UITableViewCell, LikeDelegate {
    
    func likeEnabled(isLiked: Bool) {
         print("news \(isLiked)")
        delegate?.likeNews(isLiked: isLiked )
        self.delegate?.buttonTapped(cell: self)
        likeControl.likesCount = isLiked ? likeControl.likesCount + 1 : likeControl.likesCount - 1
        
    }
    
    weak var delegate: NewsDelegate?
    
    @IBOutlet weak var newsImageView: UIImageView!
    
   // var imageView2 = UIImageView()
    @IBOutlet weak var likeControl: LikeView!
    @IBOutlet weak var countOfViewsLabel: UILabel!
    @IBOutlet weak var avatarView: AvatarView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    
    @IBAction func replyButtonPushed(_ sender: UIButton) {
        print(#function)
        delegate?.errorFunc()
    }
    
    @IBOutlet weak var newsText: UITextView!
    
    @IBAction func comentButtonPushed(_ sender: UIButton) {
        //print(#function)
        delegate?.errorFunc()
       // self.delegate?.buttonTapped(cell: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()
            userNameLabel.text = nil
            newsDateLabel.text = nil
            newsTextLabel.text = nil
            countOfViewsLabel.text = nil
            avatarView.avatarImage = nil
            likeControl.likesCount = 0
            likeControl.isLiked = false
            newsImageView.image = nil

  
    }
    
    func configure(model: NewsOfUser) {
        userNameLabel.text = model.author
        newsDateLabel.text = model.userDate.description
        newsTextLabel.text = model.newsTest
        countOfViewsLabel.text = String(model.countOfViews)
        avatarView.avatarImage = model.image.first
        likeControl.likesCount = model.countOfLike
        print(String(model.countOfLike))
        likeControl.isLiked = model.isLiked
        newsImageView.image = model.image.first
      
        
    }
    

    

    
    override func layoutSubviews() {
            super.layoutSubviews()
             likeControl.delegate = self
        
        
//          NSLayoutConstraint.activate([
//              imageView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
//              imageView2.topAnchor.constraint(equalTo: newsText.bottomAnchor, constant: 20),
//              imageView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//              imageView2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
//              
//              
//      
//          ])
        }
    
    
    
    

     
    
}

