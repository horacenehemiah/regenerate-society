//
//  EventTableViewCell.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/2/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    
    var events: Events!
    let databaseReference = Database.database().reference()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ event: Events) {
        self.events = event
        
        setEventIconImage(event.iconImg)
        eventNameLabel.text = event.eventName
        eventDateLabel.text = event.eventDate
    }
    
    func setEventIconImage(_ url: String) {
        print("Begin of code")
        if let url = URL(string: url) {
            iconImg.contentMode = .scaleAspectFit
            downloadImage(url: url)
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.iconImg.image = UIImage(data: data)
            }
        }
    }
}
