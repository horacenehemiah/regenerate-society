//
//  TeamTableViewCell.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/4/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var numberImg: UIImageView!
    @IBOutlet weak var entityLogo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var members: Members!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ member: Members) {
        self.members = member

        setNumberImage(member.numberImage)
        setEntityLogo(member.entityLogo)
        nameLabel.text = member.fullName
        titleLabel.text = member.title
    }
    
    func setNumberImage(_ url: String) {
        print("Begin of code")
        if let url = URL(string: url) {
            numberImg.contentMode = .scaleAspectFit
            downloadImage(imageView: numberImg, url: url)
        }
    }
    
    func setEntityLogo(_ url: String) {
        print("Begin of code")
        if let url = URL(string: url) {
            entityLogo.contentMode = .scaleAspectFit
            downloadImage(imageView: entityLogo, url: url)
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(imageView: UIImageView, url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
}
