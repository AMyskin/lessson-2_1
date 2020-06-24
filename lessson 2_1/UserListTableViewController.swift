//
//  UserListTableViewController.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 20.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    

    
    var userList:  Array<Array<User>> = User.itemsInSections
 
    var chars: [String] = User.sections

    
//    let searchController = UISearchController(searchResultsController: nil)
//    var filteredUsers: [User] = []
//    var isSearchBarEmpty: Bool {
//      return searchController.searchBar.text?.isEmpty ?? true
//    }
    
//    var isFiltering: Bool {
//      return searchController.isActive && !isSearchBarEmpty
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // 1
//        searchController.searchResultsUpdater = self
//        // 2
//        searchController.obscuresBackgroundDuringPresentation = false
//        // 3
//        searchController.searchBar.placeholder = "Поиск"
//        // 4
//        navigationItem.searchController = searchController
//        // 5
//        definesPresentationContext = true
        
     


    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return chars.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let char = chars[section]
        return char
    }
    
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows

        
        return userList[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell

        let user: User
 
            user = userList[indexPath.section][indexPath.row]

        cell.name.text = user.name
        cell.userImage.image = user.image[0]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "userSeque" else { return }
        guard let destination = segue.destination as? CollectionViewController else { return }
        guard let tableSection = tableView.indexPathForSelectedRow?.section else {return}
        guard let tableRow = tableView.indexPathForSelectedRow?.row else {return}
        
     
//        if isFiltering {
//            destination.userImage = filteredUsers[tableRow].image
//        } else {
             destination.userImage = userList[tableSection][tableRow].image
//        }
     
        
    }
    
//    func filterContentForSearchText(_ searchText: String) {
//      filteredUsers = userList.filter { (user: User) -> Bool in
//        return user.name.lowercased().contains(searchText.lowercased())
//      }
//
//      tableView.reloadData()
//    }
    

}

//extension UserListTableViewController: UISearchResultsUpdating {
//  func updateSearchResults(for searchController: UISearchController) {
//
//
//    let searchBar = searchController.searchBar
//    filterContentForSearchText(searchBar.text!)
//  }
//}

