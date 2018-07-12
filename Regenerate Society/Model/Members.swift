//
//  Team.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/3/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import Foundation

struct Members {
    
    fileprivate var _memberKey: String!
    fileprivate var _bio: String!
    fileprivate var _church: String!
    fileprivate var _creativeInterest: String!
    fileprivate var _email: String!
    fileprivate var _entity: String!
    fileprivate var _entityLogo: String!
    fileprivate var _firstName: String!
    fileprivate var _fullName: String!
    fileprivate var _hometown: String!
    fileprivate var _lastName: String!
    fileprivate var _mobile: String!
    fileprivate var _number: String!
    fileprivate var _numberImage: String!
    fileprivate var _prefix: String!
    fileprivate var _profileImage: String!
    fileprivate var _suffix: String!
    fileprivate var _title: String!
    fileprivate var _website: String!
    
    var memberKey: String {
        return _memberKey
    }
    
    var bio: String {
        return _bio
    }
    
    var church: String {
        return _church
    }
    var creativeInterest: String {
        return _creativeInterest
    }
    
    var email: String {
        return _email
    }
    
    var entity: String {
        return _entity
    }
    
    var entityLogo: String {
        return _entityLogo
    }
    
    var firstName: String {
        return _firstName
    }
    
    var fullName: String {
        return _fullName
    }
    
    var hometown: String {
        return _hometown
    }
    
    var lastName: String {
        return _lastName
    }
    
    var mobile: String {
        return _mobile
    }
    
    var number: String {
        return _number
    }
    
    var numberImage: String {
        return _numberImage
    }
    
    var prefix: String {
        return _prefix
    }
    
    var profileImage: String {
        return _profileImage
    }
    
    var suffix: String {
        return _suffix
    }
    
    var title: String {
        return _title
    }
    
    var website: String {
        return _website
    }
    
    // Initialize the new Member
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._memberKey = key
        
        // Within the Event, or Key, the following properties are children
        if let bio = dictionary["bio"] as? String {
            self._bio = bio
        }
        
        if let church = dictionary["church"] as? String {
            self._church = church
        }
        
        if let creativeInterest = dictionary["creativeInterest"] as? String {
            self._creativeInterest = creativeInterest
        }
        
        if let email = dictionary["email"] as? String {
            self._email = email
        }
        
        if let entity = dictionary["entity"] as? String {
            self._entity = entity
        }
        
        if let entityLogo = dictionary["entityLogo"] as? String {
            self._entityLogo = entityLogo
        }
        
        if let firstName = dictionary["firstName"] as? String {
            self._firstName = firstName
        }
        
        if let fullName = dictionary["fullName"] as? String {
            self._fullName = fullName
        }
        
        if let hometown = dictionary["hometown"] as? String {
            self._hometown = hometown
        }
        
        if let lastName = dictionary["lastName"] as? String {
            self._lastName = lastName
        }
        
        if let mobile = dictionary["mobile"] as? String {
            self._mobile = mobile
        }
        
        if let number = dictionary["number"] as? String {
            self._number = number
        }
        
        if let numberImage = dictionary["numberImage"] as? String {
            self._numberImage = numberImage
        }
        
        if let prefix = dictionary["prefix"] as? String {
            self._prefix = prefix
        }
        
        if let profileImage = dictionary["profileImage"] as? String {
            self._profileImage = profileImage
        }
        
        if let suffix = dictionary["suffix"] as? String {
            self._suffix = suffix
        }
        
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let website = dictionary["website"] as? String {
            self._website = website
        }
    }
}
