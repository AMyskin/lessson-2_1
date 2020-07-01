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
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if isFiltering {
            return filteredChars.count
        }
        
        return chars.count
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isFiltering {
            let char = filteredChars[section]
            return char
        }else {
            let char = chars[section]
            return char
        }
        
        
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isFiltering {
            return filteredUsersWithSection[section].count
        }
        
        return userList[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell
        
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
