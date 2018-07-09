//
//  EventsTableViewController.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/1/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase

class EventsTableViewController: UITableViewController {
    
    var events = [Events]()
    let databaseReference = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        getListOfEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getListOfEvents() {
        databaseReference.child("upcomingEvents").observe(DataEventType.value) {
            (snapshot) in
            
            self.events = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let eventDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let event = Events(key: key, dictionary: eventDictionary)
                        self.events.insert(event, at: 0)
                    }
                }
            }
            print("List of events: ", self.events)
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventIdentifier", for: indexPath) as! EventTableViewCell
        let event = events[indexPath.row]
        cell.configureCell(event)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let eventDetailVC = storyBoard.instantiateViewController(withIdentifier: "EventDetailViewController") as! EventDetailViewController
//        self.show(eventDetailVC, sender: self)
        
        UserDefaults.standard.set(events[indexPath.row].address, forKey: "address")
        UserDefaults.standard.set(events[indexPath.row].eventDate, forKey: "eventDate")
        UserDefaults.standard.set(events[indexPath.row].eventDate, forKey: "eventTime")
        UserDefaults.standard.set(events[indexPath.row].location, forKey: "location")
        UserDefaults.standard.set(events[indexPath.row].eventName, forKey: "name")
        UserDefaults.standard.set(events[indexPath.row].what, forKey: "what")
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
