//
//  CollectionViewController.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 20.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    
    
    var userImage : [UIImage] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userImage.count)
        
        
    }
    
    
    
    
    
    // MARK: UICollectionViewDataSource
    static func storyboardInstance() -> CollectionViewController? {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             return storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController
         }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return userImage.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCollectionViewCell
        
        
        
        
        
        cell.image.image = userImage[indexPath.row]
        
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(
//            width: collectionView.bounds.width ,
//            height: collectionView.bounds.height
//        )
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width =  CGFloat(414)
        let height = CGFloat(414)
        
        print ("-------asdfasdfasdf------\(UIScreen.main.bounds) ------------\(collectionView.layer.bounds)")
        return CGSize(width: (width/5.5), height: (height/4.5))


    }
    
    

    
    
}
