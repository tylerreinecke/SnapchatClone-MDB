//
//  FeedVC.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//
import UIKit
import FirebaseAuth

class FeedVC: UIViewController {
    var countLabel: UILabel!
    var userID: String!
    
    var tableView: UITableView!
    var arrayOfSnaps: [SnapImage]!
    
    var selectedImage: SnapImage!
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayOfSnaps()
        setupCountLabel()
        setupNavigationBar()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "My Snaps"
    }
    
    func setupArrayOfSnaps() {
        arrayOfSnaps = []
        let imageNames : [String] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let sentBy : [String] = ["Daniel", "Max", "Levi", "Robert A. Ackerman", "Zach", "Aayush", "Ayush", "Noah", "Tiger", "Mobi"]
        let timeSent : [Date] = [Date(timeIntervalSince1970: 20),
                                 Date(timeIntervalSince1970: 200),
                                 Date(timeIntervalSince1970: 200),
                                 Date(timeIntervalSince1970: 2000),
                                 Date(timeIntervalSince1970: 20000),
                                 Date(timeIntervalSince1970: 200000),
                                 Date(timeIntervalSince1970: 2000000),
                                 Date(timeIntervalSince1970: 20000000),
                                 Date(timeIntervalSince1970: 200000000),
                                 Date(timeIntervalSince1970: 2000000000),]
        for i in 0 ..< imageNames.count {
            var si = SnapImage(sentBy: sentBy[i], sentTo: "Me", timeSent: timeSent[i], image: UIImage(named: imageNames[i])!)
            arrayOfSnaps.append(si)
        }
    }
    
    func setupTableView() {
        /* PART 2A START */
        
        /* PART 2A FINISH */
    }
    
    @objc func logOut() {
        do {
            try Auth.auth().signOut()
        } catch let error{
            print(error)
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toShowImage" {
            var destination = segue.destination as! ShowImageVC
            destination.snapImage = selectedImage
        }
    }
    
}
