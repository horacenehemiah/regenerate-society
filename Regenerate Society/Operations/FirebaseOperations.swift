//
//  FirebaseOperations.swift
//  Regenerate Society
//
//  Created by Nehemiah Horace on 7/11/18.
//  Copyright © 2018 HD2Technology LLC. All rights reserved.
//

import Foundation
import Firebase

class FirebaseOperations {
    
    let databaseReferense = Database.database().reference()
    
    var ceoRSLink = String()
    var ceoWebsite = String()
    var cfoRSLink = String()
    var cfoWebsite = String()
    var cocRSLink = String()
    var cocWebsite = String()
    var cooRSLink = String()
    var cooWebsite = String()
    var csRSLink = String()
    var csWebsite = String()
    var dmprRSLink = String()
    var dmprWebsite = String()
    
    func getRSLinks() {
        let exeOfficers = databaseReferense.child("Executive Officers")
        
        // CEO
        exeOfficers.child("CEO").child("rsPage").observeSingleEvent(of: .value) {
            (snapshot) in
            self.ceoRSLink = snapshot.value as! String
            print("CEO RS Link: ", self.ceoRSLink)
        }
        
        exeOfficers.child("CEO").child("website").observeSingleEvent(of: .value) {
            (snapshot) in
            self.ceoWebsite = snapshot.value as! String
            print("CEO Website: ", self.ceoWebsite)
        }
        
        // CFO
        exeOfficers.child("CFO").child("rsPage").observeSingleEvent(of: .value) {
            (snapshot) in
            self.cfoRSLink = snapshot.value as! String
            print("CFO RS Link: ", self.cfoRSLink)
        }
        
        exeOfficers.child("CFO").child("website").observeSingleEvent(of: .value) {
            (snapshot) in
            self.cfoWebsite = snapshot.value as! String
            print("CFO Website: ", self.cfoWebsite)
        }
        
        // COC
        exeOfficers.child("COC").child("rsPage").observeSingleEvent(of: .value) {
            (snapshot) in
            self.cocRSLink = snapshot.value as! String
            print("COC RS Link: ", self.cocRSLink)
        }
        
        exeOfficers.child("COC").child("website").observeSingleEvent(of: .value) {
            (snapshot) in
            self.cocWebsite = snapshot.value as! String
            print("COC Website: ", self.cocWebsite)
        }
        
        // COO
        exeOfficers.child("COO").child("rsPage").observeSingleEvent(of: .value) {
            (snapshot) in
            self.cooRSLink = snapshot.value as! String
            print("COO RS Link: ", self.cooRSLink)
        }
        
        exeOfficers.child("COO").child("website").observeSingleEvent(of: .value) {
            (snapshot) in
            self.cooWebsite = snapshot.value as! String
            print("COO Website: ", self.cooWebsite)
        }
        
        // CS
        exeOfficers.child("CS").child("rsPage").observeSingleEvent(of: .value) {
            (snapshot) in
            self.csRSLink = snapshot.value as! String
            print("CS RS Link: ", self.csRSLink)
        }
        
        exeOfficers.child("CS").child("website").observeSingleEvent(of: .value) {
            (snapshot) in
            self.csWebsite = snapshot.value as! String
            print("CS Website: ", self.csWebsite)
        }
        
        // DMPR
        exeOfficers.child("DMPR").child("rsPage").observeSingleEvent(of: .value) {
            (snapshot) in
            self.dmprRSLink = snapshot.value as! String
            print("DMPR RS Link: ", self.dmprRSLink)
        }
        
        exeOfficers.child("DMPR").child("website").observeSingleEvent(of: .value) {
            (snapshot) in
            self.dmprWebsite = snapshot.value as! String
            print("DMPR Website: ", self.dmprWebsite)
        }
    }
}
