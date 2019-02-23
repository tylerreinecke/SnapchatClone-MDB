//
//  SnapImage.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class SnapImage {
    var uid: String?
    var sender: String
    var sentTo: String
    var timeSent: Date
    var opened: Bool
    var image: UIImage
    
    init(sentBy: String, sentTo: String, timeSent: Date, image: UIImage) {
        self.sender = sentBy
        self.sentTo = sentTo
        self.timeSent = timeSent
        self.image = image
        self.opened = false
    }
    
    init(uid: String, dict : Dictionary<String, Any?>) {
        self.uid = uid
        self.sender = dict["sender"]! as! String
        self.sentTo = dict["sentTo"]! as! String
        self.timeSent = Constants.stringToDate(dict["timeSent"] as! String)
        self.opened = dict["opened"]! as! Bool
        self.image = dict["image"] as! UIImage
    }
}
