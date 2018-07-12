//
//  Events.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 4/1/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import Foundation

struct Events {
    
    fileprivate var _eventKey: String!
    fileprivate var _address: String!
    fileprivate var _eventDate: String!
    fileprivate var _eventName: String!
    fileprivate var _eventLink: String!
    fileprivate var _eventTime: String!
    fileprivate var _headerImg: String!
    fileprivate var _iconImg: String!
    fileprivate var _location: String!
    fileprivate var _what: String!
    
    var eventKey: String {
        return _eventKey
    }
    
    var address: String {
        return _address
    }
    
    var eventDate: String {
        return _eventDate
    }
    
    var eventName: String {
        return _eventName
    }
    
    var eventLink: String {
        return _eventLink
    }
    
    var eventTime: String {
        return _eventTime
    }
    
    var headerImg: String {
        return _headerImg
    }
    
    var iconImg: String {
        return _iconImg
    }
    
    var location: String {
        return _location
    }
    
    var what: String {
        return _what
    }
    
    // Initialize the new Event
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._eventKey = key
        
        // Within the Event, or Key, the following properties are children
        if let address = dictionary["address"] as? String {
            self._address = address
        }
        
        if let eventDate = dictionary["eventDate"] as? String {
            self._eventDate = eventDate
        }
        
        if let eventName = dictionary["eventName"] as? String {
            self._eventName = eventName
        }
        
        if let eventLink = dictionary["eventLink"] as? String {
            self._eventLink = eventLink
        }
        
        if let eventTime = dictionary["eventTime"] as? String {
            self._eventTime = eventTime
        }
        
        if let headerImg = dictionary["headerImg"] as? String {
            self._headerImg = headerImg
        }
        
        if let iconImg = dictionary["iconImg"] as? String {
            self._iconImg = iconImg
        }
        
        if let location = dictionary["location"] as? String {
            self._location = location
        }
        
        if let what = dictionary["what"] as? String {
            self._what = what
        }
    }
}
