//
//  AddressBookViewController.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 6/19/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase

class AddressBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var pswdTextField: UITextField!
    @IBOutlet weak var protectedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var contacts = [Contacts]()
    var bods = [BOD]()
    var volunteers = [Volunteers]()
    var selectedCellIndexPath: IndexPath?
    var accessPswd = String()
    let databaseReference = Database.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getListOfBODs()
        getListOfContacts()
        getListOfVolunteers()
        
        databaseReference.child("_appPassword").observeSingleEvent(of: DataEventType.value) {
            (snapshot) in
            self.accessPswd = snapshot.value as! String
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getListOfBODs() {
        databaseReference.child("Board of Directors").observe(DataEventType.value) {
            (snapshot) in
            
            self.bods = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let bodDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let bod = BOD(key: key, dictionary: bodDictionary)
                        self.bods.append(bod)
                    }
                }
            }
            print("List of bod: ", self.bods)
            self.tableView.reloadData()
        }
    }
    
    func getListOfContacts() {
        databaseReference.child("Contacts").observe(DataEventType.value) {
            (snapshot) in
            
            self.contacts = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let contactDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let contact = Contacts(key: key, dictionary: contactDictionary)
                        self.contacts.append(contact)
                    }
                }
            }
            print("List of contacts: ", self.contacts)
            self.tableView.reloadData()
        }
    }
    
    func getListOfVolunteers() {
        databaseReference.child("Volunteers").observe(DataEventType.value) {
            (snapshot) in
            
            self.volunteers = []
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let volunteerDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let volunteer = Volunteers(key: key, dictionary: volunteerDictionary)
                        self.volunteers.append(volunteer)
                    }
                }
            }
            print("List of volunteers: ", self.volunteers)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func enterBtn(_ sender: Any) {
        
        if pswdTextField.text == accessPswd {
            UIView.animate(withDuration: 1, animations: {
                self.protectedView.isHidden = true
                self.protectedView.alpha = 0
                self.protectedView.resignFirstResponder()
            })
        }
        
        pswdTextField.resignFirstResponder()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
            case 0:
                return bods.count
            case 1:
                return contacts.count
            case 2:
                return volunteers.count
            default:
                return bods.count
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView.sectionIndexColor = UIColor.green
        return ["BOD", "CON", "VOL"]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var returnString = String()
        tableView.headerView(forSection: 0)?.tintColor = UIColor.white
        tableView.headerView(forSection: 1)?.tintColor = UIColor.white
        tableView.headerView(forSection: 2)?.tintColor = UIColor.white
        
        if section == 0 {
            returnString = "BOARD OF DIRECTORS"
        } else if section == 1 {
            returnString = "CONTACTS"
        } else if section == 2 {
            returnString = "VOLUNTEERS"
        }
        return returnString
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let selectedCellHeight: CGFloat = 168.0
        let unselectedCellHeight: CGFloat = 72.0
        
        if selectedCellIndexPath == indexPath {
            return selectedCellHeight
        }
        return unselectedCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! ContactTableViewCell
        
        switch (indexPath.section) {
            case 0:
                let bod = bods[indexPath.row]
                cell.configureCellTwo(bod)
            case 1:
                let contact = contacts[indexPath.row]
                cell.configureCell(contact)
            case 2:
                let volunteer = volunteers[indexPath.row]
                cell.configureCellThree(volunteer)
            default:
                break;
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedCellIndexPath != nil && selectedCellIndexPath == indexPath {
            selectedCellIndexPath = nil
        } else {
            selectedCellIndexPath = indexPath
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
