//
//  Volunteers.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 7/11/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import Foundation

struct Volunteers {
    
    fileprivate var _volunteerKey: String!
    fileprivate var _careerInterest1: String!
    fileprivate var _careerInterest2: String!
    fileprivate var _church: String!
    fileprivate var _college: String!
    fileprivate var _creativeInterest1: String!
    fileprivate var _creativeInterest2: String!
    fileprivate var _dob: String!
    fileprivate var _email: String!
    fileprivate var _gender: String!
    fileprivate var _major: String!
    fileprivate var _minor: String!
    fileprivate var _phoneNumber: String!
    
    var volunteerKey: String {
        return _volunteerKey
    }
    
    var careerInterest1: String {
        return _careerInterest1
    }
    
    var careerInterest2: String {
        return _careerInterest2
    }
    
    var church: String {
        return _church
    }
    
    var college: String {
        return _college
    }
    
    var creativeInterest1: String {
        return _creativeInterest1
    }
    
    var creativeInterest2: String {
        return _creativeInterest2
    }
    
    var dob: String {
        return _dob
    }
    
    var email: String {
        return _email
    }
    
    var gender: String {
        return _gender
    }
    
    var major: String {
        return _major
    }
    
    var minor: String {
        return _minor
    }
    
    var phoneNumber: String {
        return _phoneNumber
    }
    
    // Initialize the new Volunteer
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._volunteerKey = key
        
        // Within the Event, or Key, the following properties are children
        if let careerInterest1 = dictionary["careerInterest1"] as? String {
            self._careerInterest1 = careerInterest1
        }
        
        if let careerInterest2 = dictionary["careerInterest2"] as? String {
            self._careerInterest2 = careerInterest2
        }
        
        if let church = dictionary["church"] as? String {
            self._church = church
        }
        
        if let college = dictionary["college"] as? String {
            self._college = college
        }
        
        if let creativeInterest1 = dictionary["creativeInterest1"] as? String {
            self._creativeInterest1 = creativeInterest1
        }
        
        if let creativeInterest2 = dictionary["creativeInterest2"] as? String {
            self._creativeInterest2 = creativeInterest2
        }
        
        if let dob = dictionary["dob"] as? String {
            self._dob = dob
        }
        
        if let email = dictionary["email"] as? String {
            self._email = email
        }
        
        if let gender = dictionary["gender"] as? String {
            self._gender = gender
        }
        
        if let major = dictionary["major"] as? String {
            self._major = major
        }
        
        if let minor = dictionary["minor"] as? String {
            self._minor = minor
        }
        
        if let phoneNumber = dictionary["phoneNumber"] as? String {
            self._phoneNumber = phoneNumber
        }
    }
}
