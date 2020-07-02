//
//  NewsVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 01.07.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NewsDelegate {

    

    var userNews : [NewsOfUser] = []
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
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 200
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.allowsSelection = false
        


        
//        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//             return UITableView.automaticDimension
//         }
            
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 600.0
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.newsTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.imageView2.image = user.newsTest[indexPath.row].image[0]
       // cell.imageView?.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/2).isActive = true
       // cell.imageView?.heightAnchor.constraint(equalToConstant: self.view.frame.size.width/2).isActive = true
        cell.avatarView.avatarImage = user.avatar
        cell.userNameLabel.text = user.name
        cell.newsDateLabel.text = user.newsTest[indexPath.row].userDate.description
        cell.newsText.text = user.newsTest[indexPath.row].newsTest
       
        cell.countOfViewsLabel.text = String(Int.random(in: 1 ... 1000))
        cell.delegate = self
        
        //cell.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
         return cell
     }
    
    func errorFunc() {
        print(#function)
        showErrorAlert()
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
