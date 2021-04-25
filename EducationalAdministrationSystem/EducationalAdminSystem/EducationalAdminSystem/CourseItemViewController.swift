//
//  CourseItemViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/24.
//

import UIKit
import Firebase

class CourseItemViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblTerm: UILabel!
    @IBOutlet weak var lblLecturer: UILabel!
    @IBOutlet weak var lblSchedule: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var crnTitle = ""
    var subject = ""
    var credit = ""
    var term = ""
    var lecturer = ""
    var schedule = ""
    var courseDescription = ""
    
    var dbCRN = ""
    var dbTitle = ""
    var dbSubject = ""
    var dbCredit = 0
    var dbTerm = ""
    var dbLecturer = ""
    var dbSchedule = ""
    var dbCourseDescription = ""
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = crnTitle
        lblSubject.text = subject
        lblCredit.text = credit
        lblTerm.text = term
        lblLecturer.text = lecturer
        lblSchedule.text = schedule
        lblDescription.text = courseDescription
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        addDataToDB(dbCRN)
    }

    
    func addDataToDB(_ crn: String) {
        db.collection("courses").document(crn).setData([
            "crn": dbCRN,
            "title": dbTitle,
            "subject": dbSubject,
            "credit": dbCredit,
            "term": dbTerm,
            "lecturer": dbLecturer,
            "schedule": dbSchedule,
            "description": dbCourseDescription
        ]) {error in
            if let error = error {
                print("Error in writing documents: \(error)")
                return
            } else {
                let alert = UIAlertController(title: "Course Registration", message: "Successfully registered", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                    return
                }
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

}
