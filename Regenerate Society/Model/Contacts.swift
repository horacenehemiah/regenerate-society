//
//  Contacts.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 7/5/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import Foundation

import Foundation

struct Contacts {
    
    fileprivate var _contactKey: String!
    fileprivate var _address: String!
    fileprivate var _email: String!
    fileprivate var _notes: String!
    fileprivate var _organization: String!
    fileprivate var _phone: String!
    fileprivate var _website: String!
    
    
    var contactKey: String {
        return _contactKey
    }
    
    var address: String {
        return _address
    }
    
    var email: String {
        return _email
    }
    
    var notes: String {
        return _notes
    }
    
    var organization: String {
        return _organization
    }
    
    var phone: String {
        return _phone
    }
    
    var website: String {
        return _website
    }
    
    
    
    // Initialize the new Post
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._contactKey = key
        
        // Within the Event, or Key, the following properties are children
        if let address = dictionary["address"] as? String {
            self._address = address
        }
        
        if let email = dictionary["email"] as? String {
            self._email = email
        }
        
        if let notes = dictionary["notes"] as? String {
            self._notes = notes
        }
        
        if let organization = dictionary["organization"] as? String {
            self._organization = organization
        }
        
        if let phone = dictionary["phone"] as? String {
            self._phone = phone
        }
        
        if let website = dictionary["website"] as? String {
            self._website = website
        }
    }
}
