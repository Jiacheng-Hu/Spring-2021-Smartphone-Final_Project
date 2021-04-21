//
//  DashboardViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/21.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setHidesBackButton(true, animated: false)
    }

    @IBAction func logoutAction(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            KeychainService().keyChain.delete("uid")
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}
