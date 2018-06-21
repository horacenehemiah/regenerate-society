//
//  TeamTableViewController.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/4/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase

class TeamTableViewController: UITableViewController {
    
    var members = [Members]()
    let databaseReference = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getListOfMembers()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getListOfMembers() {
        databaseReference.child("Executive Officers").observe(DataEventType.value) {
            (snapshot) in
            
            self.members = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let eventDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let member = Members(key: key, dictionary: eventDictionary)
                        self.members.append(member)
                    }
                }
            }
            print("List of members: ", self.members)
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamIdentifier", for: indexPath) as! TeamTableViewCell
        let member = members[indexPath.row]
        cell.configureCell(member)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            if let url = URL(string: "https://www.iamwescam.com") {
                UIApplication.shared.open(url, options: [:])
            }
        } else if (indexPath.row == 1) {
            if let url = URL(string: "http://legendarykreations.com") {
                UIApplication.shared.open(url, options: [:])
            }
        } else if (indexPath.row == 3) {
            if let url = URL(string: "https://hd2technology.com") {
                UIApplication.shared.open(url, options: [:])
            }
        } else if (indexPath.row == 4) {
            if let url = URL(string: "https://www.miyakostudios.com") {
                UIApplication.shared.open(url, options: [:])
            }
        }

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let info = UITableViewRowAction(style: .normal, title: "ℹ︎") { (action, indexPath) in
            if (indexPath.row == 0) {
                if let url = URL(string: "https://thisisrsociety.com/wesley_wright/") {
                    UIApplication.shared.open(url, options: [:])
                }
            } else if (indexPath.row == 1) {
                if let url = URL(string: "https://thisisrsociety.com/0-oj-montgomery/") {
                    UIApplication.shared.open(url, options: [:])
                }
            } else if (indexPath.row == 2) {
                if let url = URL(string: "https://thisisrsociety.com/april-moton/") {
                    UIApplication.shared.open(url, options: [:])
                }
            } else if (indexPath.row == 3) {
                if let url = URL(string: "https://thisisrsociety.com/4-nehemiah-horace/") {
                    UIApplication.shared.open(url, options: [:])
                }
            } else if (indexPath.row == 4) {
                if let url = URL(string: "https://thisisrsociety.com/8-sheleka-laseter/") {
                    UIApplication.shared.open(url, options: [:])
                }
            } else if (indexPath.row == 5) {
                if let url = URL(string: "https://thisisrsociety.com/briauna-perryman/") {
                    UIApplication.shared.open(url, options: [:])
                }
            }
        }
        
        info.backgroundColor = UIColor.black
        
        return [info]
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
