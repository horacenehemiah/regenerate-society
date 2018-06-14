//
//  MenuTableViewCell.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/1/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var homeMenuLabel: UILabel!
    @IBOutlet weak var eventsMenuLabel: UILabel!
    @IBOutlet weak var volunteerMenuLabel: UILabel!
    @IBOutlet weak var teamMenuLabel: UILabel!
    @IBOutlet weak var galleryMenuLabel: UILabel!
    @IBOutlet weak var aboutMenuLabel: UILabel!
    @IBOutlet weak var contactMenuLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
