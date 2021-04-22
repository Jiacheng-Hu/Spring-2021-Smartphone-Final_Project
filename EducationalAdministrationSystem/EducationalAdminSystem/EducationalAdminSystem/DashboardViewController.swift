//
//  DashboardViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/21.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var imgEvents: UIImageView!
    @IBOutlet weak var imgCourse: UIImageView!
    @IBOutlet weak var imgSchedule: UIImageView!
    @IBOutlet weak var imgGrade: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgLogo.image = UIImage(named: "logo")
        imgEvents.image = UIImage(named: "Events")
        imgCourse.image = UIImage(named: "Course")
        imgSchedule.image = UIImage(named: "Schedule")
        imgGrade.image = UIImage(named: "Grade")
        
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    @IBAction func eventsAction(_ sender: UIButton) {
        performSegue(withIdentifier: "eventsSegue", sender: self)
    }
    
    @IBAction func courseAction(_ sender: UIButton) {
        performSegue(withIdentifier: "courseSegue", sender: self)
    }
    
    @IBAction func scheduleAction(_ sender: UIButton) {
        performSegue(withIdentifier: "scheduleSegue", sender: self)
    }
    
    @IBAction func gradeAction(_ sender: UIButton) {
        performSegue(withIdentifier: "gradeSegue", sender: self)
    }
    
}
