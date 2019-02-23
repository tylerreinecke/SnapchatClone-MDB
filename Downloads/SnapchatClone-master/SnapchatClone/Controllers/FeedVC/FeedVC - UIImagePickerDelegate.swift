//
//  FeedVC - UIImagePickerDelegate.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/25/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FeedVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            imageToAdd = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imageToAdd = possibleImage
        } else {
            return
        }
        
        var sentToPerson = "12SM73B8IRY2eBKDBOjEQxhYIFz2" // just an arbitrary person
        selectedImage = SnapImage(sentBy: userID, sentTo: sentToPerson, timeSent: Date(), image: imageToAdd)
        
        FirebaseAPIClient.putImage(selectedImage, completion: { didSucceed in
            self.dismiss(animated: true)

            if !didSucceed {
                self.displayAlert(title: "Error", message: "Trouble putting image into database")
            }
        })
    }
}
