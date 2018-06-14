//
//  HomeViewController.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 3/31/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import Firebase
import AVKit
import AVFoundation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var twitterContainer: UIView!
    @IBOutlet weak var eventContainer: UIView!
    @IBOutlet weak var teamContainer: UIView!
    @IBOutlet weak var galleryContainer: UIView!
    @IBOutlet weak var aboutContainer: UIView!
    @IBOutlet weak var contactContainer: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var mutableString = NSMutableAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
        mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:17))
        titleLabel.attributedText = mutableString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        showHideMenuView()
    }
    
    func showHideMenuView() {
        if menuTableView.transform == .identity {
            UIView.animate(withDuration: 1, animations: {
                self.menuTableView.transform = CGAffineTransform.init(translationX: 0, y: self.twitterContainer.frame.size.height)
                self.menuTableView.frame.size.height = self.twitterContainer.frame.size.height
                self.menuTableView.frame.origin.y = self.twitterContainer.frame.origin.y
                self.gradientView.isHidden = false
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.menuTableView.transform = .identity
                self.gradientView.isHidden = true
            })
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if (indexPath.row == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: "homeIdentifier", for: indexPath)
        } else if (indexPath.row == 1) {
            cell = tableView.dequeueReusableCell(withIdentifier: "upcomingEventsIdentifier", for: indexPath)
        } else if (indexPath.row == 2) {
            cell = tableView.dequeueReusableCell(withIdentifier: "volunteerCheckInIdentifier", for: indexPath)
        } else if (indexPath.row == 3) {
            cell = tableView.dequeueReusableCell(withIdentifier: "meetTheTeamIdentifier", for: indexPath)
        } else if (indexPath.row == 4) {
            cell = tableView.dequeueReusableCell(withIdentifier: "galleryIdentifier", for: indexPath)
        } else if (indexPath.row == 5) {
            cell = tableView.dequeueReusableCell(withIdentifier: "aboutRSIdentifier", for: indexPath)
        } else if (indexPath.row == 6) {
            cell = tableView.dequeueReusableCell(withIdentifier: "contactRSrIdentifier", for: indexPath)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.row == 0) {
            titleLabel.text = "REVIVE. RESTORE. REGENERATE."
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:17))
            titleLabel.attributedText = mutableString
            twitterContainer.isHidden = false
            eventContainer.isHidden = true
            teamContainer.isHidden = true
            galleryContainer.isHidden = true
            aboutContainer.isHidden = true
            contactContainer.isHidden = true
            showHideMenuView()
        } else if (indexPath.row == 1) {
            titleLabel.text = "UPCOMING EVENTS"
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:9))
            titleLabel.attributedText = mutableString
            twitterContainer.isHidden = true
            eventContainer.isHidden = false
            teamContainer.isHidden = true
            galleryContainer.isHidden = true
            aboutContainer.isHidden = true
            contactContainer.isHidden = true
            showHideMenuView()
        } else if (indexPath.row == 2) {
            titleLabel.text = "VOLUNTEER CHECK-IN"
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:10))
            titleLabel.attributedText = mutableString
            showHideMenuView()
        } else if (indexPath.row == 3) {
            titleLabel.text = "MEET THE TEAM"
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:9))
            titleLabel.attributedText = mutableString
            twitterContainer.isHidden = true
            eventContainer.isHidden = true
            teamContainer.isHidden = false
            showHideMenuView()
        } else if (indexPath.row == 4) {
            titleLabel.text = "GALLERY"
            twitterContainer.isHidden = true
            eventContainer.isHidden = true
            teamContainer.isHidden = true
            galleryContainer.isHidden = false
            aboutContainer.isHidden = true
            contactContainer.isHidden = true
            showHideMenuView()
        } else if (indexPath.row == 5) {
            titleLabel.text = "ABOUT RS"
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:6))
            titleLabel.attributedText = mutableString
            twitterContainer.isHidden = true
            eventContainer.isHidden = true
            teamContainer.isHidden = true
            galleryContainer.isHidden = true
            aboutContainer.isHidden = false
            contactContainer.isHidden = true
            showHideMenuView()
        } else if (indexPath.row == 6) {
            titleLabel.text = "CONTACT RS"
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:8))
            titleLabel.attributedText = mutableString
            twitterContainer.isHidden = true
            eventContainer.isHidden = true
            teamContainer.isHidden = true
            galleryContainer.isHidden = true
            aboutContainer.isHidden = true
            contactContainer.isHidden = false
            showHideMenuView()
        }
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
