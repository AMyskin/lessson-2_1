//
//  UserListTableViewController.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 20.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class UserListTableViewController: UITableViewController {
    
    var userList: [User] = [User(name: "This is user one", image: UIImage(named: "user1.jpg")!),
                            User(name: "This is user two", image: UIImage(named: "user2.jpeg")!),
                            User(name: "This is user three", image: UIImage(named: "user1.jpeg")!)
                            

    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }





    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell

        cell.name.text = userList[indexPath.row].name
        cell.userImage.image = userList[indexPath.row].image
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
        
        guard let tableRow = tableView.indexPathForSelectedRow?.row else {return}
        
      destination.userImage = userList[tableRow].image
        
    }
    

}
