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

    @IBOutlet weak var logoTitleView: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var menuBtn: UIButton!
    
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
        
        updateConstraints()
        menuAnimation()
        
        mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
        mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:17))
        titleLabel.attributedText = mutableString
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(contactAccess))
        tap.numberOfTapsRequired = 7
        logoTitleView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        showHideMenuView()
    }
    
    @objc func contactAccess() {
        print("Test tap")
        let addressBookViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddressBookViewController") as! AddressBookViewController
        self.navigationController?.pushViewController(addressBookViewController, animated: true)
    }
    
    func menuAnimation() {
        menuBtn.layer.cornerRadius = 0.5 * menuBtn.bounds.size.width
        
        UIView.animate(withDuration: 2, animations: {
            self.logo.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi)
            self.logo.transform = CGAffineTransform.init(scaleX: 1.25, y: 1.25)
            
            let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
            pulseAnimation.duration = 1
            pulseAnimation.fromValue = 0
            pulseAnimation.toValue = 1
            pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            pulseAnimation.autoreverses = true
            pulseAnimation.repeatCount = .greatestFiniteMagnitude
            self.menuBtn.layer.add(pulseAnimation, forKey: "animateOpacity")
            
        })
    }
    
    func showHideMenuView() {
        if menuTableView.transform == .identity {
            UIView.animate(withDuration: 1, animations: {
                self.menuTableView.transform = CGAffineTransform.init(translationX: 0, y: self.twitterContainer.frame.size.height)
                self.menuTableView.frame.size.height = self.twitterContainer.frame.size.height
                self.menuTableView.frame.origin.y = self.twitterContainer.frame.origin.y
                self.gradientView.isHidden = false
                self.menuTableView.isHidden = false
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.menuTableView.transform = .identity
                self.gradientView.isHidden = true
            })
        }
    }
    
    func updateConstraints() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        print("Device sizes: \(screenWidth) x \(screenHeight)")
        
//        if (screenWidth == 768) && (screenHeight == 1024) {
//            print("iPad Pro 9.7")
//            logoTitleView.translatesAutoresizingMaskIntoConstraints = true
//            logoTitleView.frame.size.height = logoTitleView.frame.size.height * 4
//            logoTitleView.updateConstraints()
//        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if (indexPath.row == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: "homeIdentifier", for: indexPath)
        } else if (indexPath.row == 1) {
            cell = tableView.dequeueReusableCell(withIdentifier: "upcomingEventsIdentifier", for: indexPath)
        } else if (indexPath.row == 2) {
            cell = tableView.dequeueReusableCell(withIdentifier: "meetTheTeamIdentifier", for: indexPath)
        } else if (indexPath.row == 3) {
            cell = tableView.dequeueReusableCell(withIdentifier: "aboutRSIdentifier", for: indexPath)
        } else if (indexPath.row == 4) {
            cell = tableView.dequeueReusableCell(withIdentifier: "contactRSIdentifier", for: indexPath)
        } else if (indexPath.row == 5) {
            cell = tableView.dequeueReusableCell(withIdentifier: "donateIdentifier", for: indexPath)
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
            titleLabel.text = "MEET THE TEAM"
            mutableString = NSMutableAttributedString(string: titleLabel.text!, attributes: [NSAttributedStringKey.font:UIFont(name: "Duke", size: 36.0)!])
            mutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location:0,length:9))
            titleLabel.attributedText = mutableString
            twitterContainer.isHidden = true
            eventContainer.isHidden = true
            teamContainer.isHidden = false
            showHideMenuView()
        } else if (indexPath.row == 3) {
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
        } else if (indexPath.row == 4) {
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
        } else if (indexPath.row == 5) {
            if let url = URL(string: "https://www.paypal.com/donate/?token=YAXxb2v9Z8LYFy2vAfrZC6PQKFki5hKix7AJS2oQv6PuIaoKNsWwqE9WdyWWZ3OgkTrVpW&country.x=US&locale.x=US") {
                UIApplication.shared.open(url, options: [:])
            }
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
