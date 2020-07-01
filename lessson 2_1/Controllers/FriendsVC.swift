//
//  FriendsVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 24.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class FriendsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CharDelegate {
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredUsers: [User]  = []
    var filteredUsersWithSection : [Array<User>] = []
    var filteredChars: [String] = User.sectionsOfFriends
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    
    
    
    var isFiltering: Bool {
        
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    var char: String = ""
    
    func charPushed(char letter: String) {

        
        guard let section = filteredChars.firstIndex(of: letter) else { return }
        tableView.scrollToRow(at: IndexPath(row: 0, section: section),
                              at: .top,
                              animated: false)
        
    }
    
    
    
    
    @IBOutlet weak var charPicker: CharPicker!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    var userList = User.arrayOfFriends
    
    var chars = User.sectionsOfFriends
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        charPicker.delegate = self
        charPicker.chars = chars
        
        
        
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Поиск"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
        setupTableView()
    }
    
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "FreindsCell", bundle: nil), forCellReuseIdentifier: "Cell")
        let headerNib = UINib.init(nibName: "FriendsHeaderCell", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "FriendsHeaderCell")
    }
    
    static func storyboardInstance() -> CollectionViewController? {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             return storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController
         }
    

 
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isFiltering {
            return filteredChars.count
        }
        
        return chars.count
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FriendsHeaderCell") as! FriendsHeaderCell
            
            headerView.headerTitle.text = filteredChars[section]
            
            return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 40
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//
//
//        if isFiltering {
//            let char = filteredChars[section]
//            return char
//        }else {
//            let char = chars[section]
//            return char
//        }
//
//
//    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isFiltering {
            return filteredUsersWithSection[section].count
        }
        
        return userList[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FreindsCell
        
        
        let user: User
        
        if isFiltering {
            user = filteredUsersWithSection[indexPath.section][indexPath.row]
        } else {
            user = userList[indexPath.section][indexPath.row]
        }
        
        
        
        cell.name.text = user.name
        cell.avatarView.avatarImage = user.avatar
        
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    let testVC = CollectionViewController.storyboardInstance()
        
        if isFiltering {
            testVC?.userImage = filteredUsersWithSection[indexPath.section][indexPath.row].image
        } else {
            testVC?.userImage = userList[indexPath.section][indexPath.row].image
        }
        navigationController?.pushViewController(testVC!, animated: true)
        
   
    }
    
    
    
//    func scrollToValue(section : Int) {
//        let scrollPosition: Int = 0
//        let indexPath = IndexPath(row: scrollPosition, section: section)
//        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
//    }
    
    func letterPicked(_ letter: String) {
        guard let section = filteredChars.firstIndex(of: letter) else { return }
        tableView.scrollToRow(at: IndexPath(row: 0, section: section),
                              at: .top,
                              animated: false)
    }
    
    
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    @IBAction func passData() {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          guard let secondViewController = storyboard.instantiateViewController(identifier: "CollectionViewController") as? CollectionViewController else { return }
       
          
          show(secondViewController, sender: nil)
      }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "userSeque" else { return }
        guard let destination = segue.destination as? CollectionViewController else { return }
        guard let tableSection = tableView.indexPathForSelectedRow?.section else {return}
        guard let tableRow = tableView.indexPathForSelectedRow?.row else {return}
        
        
        
        if isFiltering {
            destination.userImage = filteredUsersWithSection[tableSection][tableRow].image
        } else {
            destination.userImage = userList[tableSection][tableRow].image
        }
    
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        var allUsers: [User] = []
        for (index, _) in userList.enumerated() {
            for item in userList[index]{
                
                allUsers.append(item)
            }
            
        }
        
        
        filteredUsers = allUsers.filter { (user: User) -> Bool in
            
            return user.name.lowercased().contains(searchText.lowercased())
        }
        
        
        
        filteredUsersWithSection = []
        filteredChars = []
        
        filteredChars  =
            Array(
                Set(
                    filteredUsers.map ({
                        String($0.name.prefix(1)).uppercased()
                    })
                )
            ).sorted()
        
        var arrayOfFriends:  Array<Array<User>>
        {
            var tmp:Array<Array<User>> = []
            
            for section in filteredChars {
                let letter: String = section
                tmp.append(filteredUsers.filter { $0.name.hasPrefix(letter) })
            }
            return tmp
            
        }
        filteredUsersWithSection = arrayOfFriends
        
        if searchText == "" {
            filteredChars = User.sectionsOfFriends
        }
        
        charPicker.chars = filteredChars
        
        
        tableView.reloadData()
        
        
    }
    
    
    
    
    
    
    
}
extension FriendsVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

extension UIView{
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
