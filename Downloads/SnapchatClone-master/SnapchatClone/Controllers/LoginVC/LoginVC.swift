//
//  LoginVC.swift
//  SnapchatClone
//
//  Created by Max Miranda on 9/18/18.
//  Copyright © 2018 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    var logoImageView: UIImageView!
    var loginRegisterSegControl: UISegmentedControl!
    
    var nameTextField: UITextField!
    var phoneNumberTextField: UITextField!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    
    var loginRegisterButton: UIButton!
    
    var ourUserID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 255, g: 254, b: 0)
        setupLogo()
        setupSegControl()
        setupLoginRegisterButton()
        setupTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        loginRegisterButton.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    @objc func handleLoginOrRegister() {
        loginRegisterButton.isUserInteractionEnabled = false
        if loginRegisterSegControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        var email = "wubba@lubbadubdub.com"
        var password = "ImMrMeeseeks"
        /* PART 1A START*/
        
        /* PART 1A FINISH*/
        FirebaseAPIClient.signIn(self, email, password)
    }
    
    func handleRegister() {
        var name = "Rick Morty"
        var number = "6969696969"
        var email = "wubba@lubbadubdub.com"
        var password = "ImMrMeeseeks"
        /* PART 1B START*/
        
        /* PART 1B FINISH*/
        FirebaseAPIClient.registerUser(name, number, email, password, completion: { (didAddSuccessfully, uid) in
            self.loginRegisterButton.isUserInteractionEnabled = true
            if didAddSuccessfully {
                self.ourUserID = uid
                self.performSegue(withIdentifier: "toMainFeed", sender: self)
            } else {
                self.displayAlert(title: "Error", message: "There was a problem creating you")
            }
            
        })
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleLoginRegisterChange() {
        let index = loginRegisterSegControl.selectedSegmentIndex
        let title = loginRegisterSegControl.titleForSegment(at: index)
        loginRegisterButton.setTitle(title, for: UIControlState())
        
        if title == "Login" {
            nameTextField.isHidden = true
            phoneNumberTextField.isHidden = true
        } else {
            nameTextField.isHidden = false
            phoneNumberTextField.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /* PART 1C START*/
        if segue.identifier == "toMainFeed" {
            var destination = segue.destination as! FeedVC
            destination.userID = ourUserID
        }
        /* PART 1C FINISH*/
    }
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
