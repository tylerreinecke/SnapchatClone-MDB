//
//  FeedVC - TableViewFunctions.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /* PART 2B START */
        return arrayOfSnaps.count
        /* PART 2B FINISH */
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath[1]
        // look at DateFormatter documentation to figure out how to convert a SnapImage.timeSent to a label's text
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
            as! FeedTableViewCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        /* PART 2C START */
        cell.awakeFromNib()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        cell.senderLabel.text = arrayOfSnaps[index].sender
        cell.dateSentLabel.text = "Sent on \(formatter.string(from: arrayOfSnaps[index].timeSent))"
        
        if(!arrayOfSnaps[index].opened) {
            cell.hasBeenOpenedSquare.backgroundColor = UIColor.init(red: 232/255, green: 53/255, blue: 46/255, alpha: 1)
            
        } else {
            var makeSquareHollow: UIView!
            makeSquareHollow = UIView(frame: CGRect(x: 20 + 3, y: 15 + 3, width: 30 - 6, height: 30 - 6))
            makeSquareHollow.layer.cornerRadius = 5
            makeSquareHollow.backgroundColor = .white
            cell.contentView.addSubview(makeSquareHollow)
        }
        /* PART 2C FINISH*/
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var index = indexPath[1]
        /* PART 2D START */
        selectedImage = arrayOfSnaps[index]
        selectedImage.opened = true
        self.performSegue(withIdentifier: "toShowImage", sender: self)
        var navigationArray = self.navigationController?.viewControllers //To get all UIViewController stack as Array
        navigationArray!.remove(at: (navigationArray?.count)! - 2) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray!
        /* PART 2D FINISH */
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
