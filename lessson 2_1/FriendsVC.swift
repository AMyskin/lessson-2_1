//
//  FriendsVC.swift
//  lessson 2_1
//
//  Created by Alexander Myskin on 24.06.2020.
//  Copyright © 2020 Alexander Myskin. All rights reserved.
//

import UIKit

class FriendsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var charPicker: CharPicker!
    @IBOutlet weak var tableView: UITableView!
  
    
    
    
    
    var userList:  Array<Array<User>> = User.itemsInSections
    
    var chars: [String] = User.sections
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return chars.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let char = chars[section]
        return char
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return userList[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserCell
        
        let user: User
        
        user = userList[indexPath.section][indexPath.row]
        
        cell.name.text = user.name
        cell.avatarView.avatarImage = user.avatar
       // cell.userImage.image = user.image[0]
        return cell
    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "userSeque" else { return }
        guard let destination = segue.destination as? CollectionViewController else { return }
        guard let tableSection = tableView.indexPathForSelectedRow?.section else {return}
        guard let tableRow = tableView.indexPathForSelectedRow?.row else {return}
        
        
        destination.userImage = userList[tableSection][tableRow].image
        
        
        
    }
    
    
    
    
    
    
    
}
