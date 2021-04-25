//
//  ViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/21.
//

import UIKit
import Firebase
import SwiftSpinner

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgLogo.image = UIImage(named: "logo")
        lblStatus.text = ""
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let keyChain = KeychainService().keyChain
        if keyChain.get("uid") != nil {
            self.performSegue(withIdentifier: "dashboardSegue", sender: self)
        }
    }

    @IBAction func loginAction(_ sender: UIButton) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        
        if email == "" || password == "" || password.count < 6 {
            lblStatus.text = "Please enter valid Email/Password"
            return
        }
        
        if !email.isEmail {
            lblStatus.text = "Please enter valid Email"
            return
        }
        
        SwiftSpinner.show("Logging you in...")
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            SwiftSpinner.hide()
            
            guard let self = self else { return }
            
            if error != nil {
                self.lblStatus.text = error?.localizedDescription
                return
            }
            
            guard let uid = Auth.auth().currentUser?.uid else {return}
            
            self.addKeyChain(uid)
            
            self.performSegue(withIdentifier: "dashboardSegue", sender: self)
            
        }
    }
    
    func addKeyChain(_ uid: String) {
        let keyChain = KeychainService().keyChain
        keyChain.set(uid, forKey: "uid")
    }
    
}

