//
//  ContactTableViewCell.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 7/5/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var organization: UILabel!
    @IBOutlet weak var phoneNumber: UITextView!
    @IBOutlet weak var email: UITextView!
    @IBOutlet weak var website: UITextView!
    @IBOutlet weak var address: UITextView!

    var contacts: Contacts!
    var bod: BOD!
    var volunteers: Volunteers!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(_ contact: Contacts) {
        self.contacts = contact
        
        name.text = contact.contactKey
        organization.text = contact.organization
        phoneNumber.text = contact.phone
        email.text = contact.email
        website.text = contact.website
        address.text = contact.address
    }
    
    func configureCellTwo(_ bod: BOD) {
        self.bod = bod
        
        name.text = bod.contactKey
        organization.text = bod.organization
        phoneNumber.text = bod.phone
        email.text = bod.email
        website.text = bod.website
        address.text = bod.address
    }
    
    func configureCellThree(_ volunteer: Volunteers) {
        self.volunteers = volunteer
        
        name.text = volunteer.volunteerKey
        organization.text = "College: \(volunteer.college) - Major: \(volunteer.major)"
        phoneNumber.text = volunteer.phoneNumber
        email.text = volunteer.email
        website.text = "Career Interest: \(volunteer.careerInterest1)"
        address.text = "Creative Interest: \(volunteer.creativeInterest1)"
    }
}
