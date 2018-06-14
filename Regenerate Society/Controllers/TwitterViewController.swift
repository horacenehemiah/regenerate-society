//
//  TwitterViewController.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 3/21/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource = TWTRUserTimelineDataSource(screenName: "thisisrsociety", apiClient: TWTRAPIClient())
        TWTRTweetView.appearance().backgroundColor = UIColor.black
        TWTRTweetTableViewCell.appearance().backgroundColor = UIColor.black
        TWTRTweetView.appearance().primaryTextColor = UIColor.white
        TWTRTweetView.appearance().linkTextColor = UIColor.green
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
