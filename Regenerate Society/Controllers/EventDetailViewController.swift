//
//  EventDetailViewController.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/8/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase

class EventDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eventTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nameLabel = UserDefaults.standard.object(forKey: "name") as? String
        eventTitle.text = nameLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailIdentifier", for: indexPath) as! EventDetailTableViewCell
        
        let whatLabel = UserDefaults.standard.object(forKey: "what") as? String
        let dateLabel = UserDefaults.standard.object(forKey: "eventDate") as? String
        let locationLabel = UserDefaults.standard.object(forKey: "location") as? String
        
        if indexPath.row == 0 {
            cell.cellTitle.text = "WHAT:"
            cell.descriptionLabel.text = whatLabel
        } else if indexPath.row == 1 {
            cell.cellTitle.text = "WHEN:"
            cell.descriptionLabel.text = dateLabel
        } else if indexPath.row == 2 {
            cell.cellTitle.text = "WHERE:"
            cell.descriptionLabel.text = locationLabel
        }    
        
        return cell
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
