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
    var selectedCellIndexPath: IndexPath?
    var accessPswd = String()
    let databaseReference = Database.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getListOfContacts()
        
        databaseReference.child("_appPassword").observeSingleEvent(of: DataEventType.value) {
            (snapshot) in
            self.accessPswd = snapshot.value as! String
            print("Contact Access Password", self.accessPswd)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
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
        let contact = contacts[indexPath.row]
        cell.configureCell(contact)
        
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
