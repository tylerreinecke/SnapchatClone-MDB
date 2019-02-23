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

    var imageToAdd: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayOfSnaps()
        setupCountLabel()
        setupNavigationBar()
        // Do any additional setup after loading the view.
        setupTableView()
        FirebaseAPIClient.getSnapImage("-LNFJ4-ShTcr7mwiQ30X", completion: { (returnedSnap) in
            guard let mySnap = returnedSnap else {
                self.displayAlert(title: "There was an error", message: "Pulling image from Firebase")
                return
            }
            self.arrayOfSnaps.append(mySnap)
            self.tableView.reloadData()
        })
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
        tableView = UITableView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height - 80))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "feedCell")
        view.addSubview(tableView)
        

        /* PART 2A FINISH */
    }

    @objc func addImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func callLogOut() {
        FirebaseAPIClient.logOut(completion: { (didSucceed) in
            if didSucceed  {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.displayAlert(title: "There was an error", message: "Couldnt log you out")
            }
        })
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toShowImage" {
            var destination = segue.destination as! ShowImageVC
            destination.snapImage = selectedImage
        }
    }

    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

}
