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

}
