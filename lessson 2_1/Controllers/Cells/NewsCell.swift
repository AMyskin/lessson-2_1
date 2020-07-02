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
}

class NewsCell: UITableViewCell, LikeDelegate {
    func likeEnabled(isLiked: Bool) {
         print(isLiked)
    }
    
    weak var delegate: NewsDelegate?
    
    
    var imageView2 = UIImageView()
    @IBOutlet weak var likeControl: LikeView!
    @IBOutlet weak var countOfViewsLabel: UILabel!
    
    @IBOutlet weak var avatarView: AvatarView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var newsDateLabel: UILabel!
    
    @IBAction func replyButtonPushed(_ sender: UIButton) {
        print(#function)
        delegate?.errorFunc()
    }
    
    @IBOutlet weak var newsText: UITextView!
    
    @IBAction func comentButtonPushed(_ sender: UIButton) {
        print(#function)
        delegate?.errorFunc()
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
         self.userNameLabel.text = nil
         self.newsText.text = nil
         self.newsDateLabel.text = nil
         self.avatarView.avatarImage = nil
     }
    

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        
          
           
        addSubview(imageView2)
        
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        // cell.imageView?.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/2).isActive = true
        // cell.imageView?.heightAnchor.constraint(equalToConstant: self.view.frame.size.width/2).isActive = true
//
//        NSLayoutConstraint.activate([
//            imageView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
//            imageView2.topAnchor.constraint(equalTo: newsText.bottomAnchor, constant: 110),
//            imageView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
//            imageView2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
//
//
//            //               imageView2.topAnchor.constraint(equalTo: topAnchor, constant: 300),
//            //               imageView2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100),
//            //               imageView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
//            //               imageView2.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
//        ])
        
        //print("-----asd----- \(UIScreen.main.bounds) --------- \(bounds.size)")
        imageView2.layer.borderColor = UIColor.yellow.cgColor
        imageView2.layer.borderWidth = 2
        imageView2.contentMode = .scaleAspectFill
        imageView2.clipsToBounds = true
        
        
        
       }
    
    override func layoutSubviews() {
            super.layoutSubviews()
             likeControl.delegate = self
        
        
          NSLayoutConstraint.activate([
              imageView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
              imageView2.topAnchor.constraint(equalTo: newsText.bottomAnchor, constant: 20),
              imageView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
              imageView2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
              
              
             
              //               imageView2.topAnchor.constraint(equalTo: topAnchor, constant: 300),
              //               imageView2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100),
              //               imageView2.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
              //               imageView2.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
          ])
        }
    
    
    
    

     
    
}

