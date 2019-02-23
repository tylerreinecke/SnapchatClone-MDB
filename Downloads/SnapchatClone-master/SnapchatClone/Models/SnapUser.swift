//
//  SnapUser.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class SnapUser {
    var uid : String
    var name : String
    var phoneNumber : String
    var email : String

    init(_ uid: String, _ name: String, _ phoneNumber : String, _ email: String) {
        self.uid = uid
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
    
    init(_ uid: String, _ dict : Dictionary<String, Any?>) {
        self.uid = uid
        self.name = dict["name"]! as! String
        self.phoneNumber = dict["phoneNumber"]! as! String
        self.email = dict["email"]! as! String
    }
    
}
