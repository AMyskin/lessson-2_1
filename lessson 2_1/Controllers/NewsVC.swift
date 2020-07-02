//
//  NewsVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 01.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NewsDelegate {
    

    


    var user : User!
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        
     
        // Do any additional setup after loading the view.
    }
    
    static func storyboardInstance() -> NewsVC? {
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let cell = storyboard.instantiateViewController(withIdentifier: "NewsVC") as? NewsVC
        
               return cell
           }
    
    private func setupTableView() {
        

        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.allowsSelection = false
        

    }
        
        
 
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.newsTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
                
        cell.configure(model: user.newsTest[indexPath.row])
        
        
        
         
        cell.delegate = self
        
        
         return cell
     }
    
    
    
    
    
    
    func buttonTapped(cell: NewsCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            // Note, this shouldn't happen - how did the user tap on a button that wasn't on screen?
            return
        }

        user.newsTest[indexPath.row].isLiked.toggle()
        
        let likesCount = user.newsTest[indexPath.row].countOfLike
        
        user.newsTest[indexPath.row].countOfLike = user.newsTest[indexPath.row].isLiked ? likesCount + 1 : likesCount - 1

        print("Button tapped on row \(indexPath.row) new countOfLike = \(user.newsTest[indexPath.row].countOfLike)")
    }
    
   
    
    
    
    
    
    
    
    
    
    func errorFunc() {
        print(#function)
        showErrorAlert()
    }
    func likeNews(isLiked: Bool) {
        print("like \(isLiked)")
    }

    func showErrorAlert() {
        let alert = UIAlertController(
            title: "Under Conctruction",
            message: "Данный функционал в разработке",
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}
