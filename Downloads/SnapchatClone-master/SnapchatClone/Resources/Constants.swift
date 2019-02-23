//
//  Constants.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/25/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit
class Constants {
    static let formatter = DateFormatter()
    
    static func dateToString(_ date : Date) -> String{
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    static func stringToDate(_ str: String) -> Date {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: str)!;
    }
}
