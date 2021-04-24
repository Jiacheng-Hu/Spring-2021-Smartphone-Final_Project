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
    
    var crn = ""
    var courseTitle = ""
    var crnTitle = ""
    var subject = ""
    var credit = ""
    var term = ""
    var lecturer = ""
    var schedule = ""
    var courseDescription = ""
    
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
        if didExistInDB(crn) {
            let alert = UIAlertController(title: "Course Registration", message: "You have registered this course", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
                return
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            addDataToDB(crn)
        }
        
//        let alert = UIAlertController(title: "Course Registration", message: "Test", preferredStyle: .alert)
//        let ok = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
//            return
//        }
//        alert.addAction(ok)
//        self.present(alert, animated: true, completion: nil)
    }
    
    func didExistInDB(_ crn: String) -> Bool {
        let docRef = db.collection("courses").document(crn)
        var temp = false
        docRef.getDocument { (document, error) in
            if error != nil {
                print("Error in getting access in database")
                return
            }
            if let document = document, document.exists {
                temp = true
            } else {
                temp = false
            }
        }
        return temp
    }
    
    func addDataToDB(_ crn: String) {
        db.collection("courses").document(crn).setData([
            "crn": crn,
            "title": courseTitle,
            "subject": subject,
            "credit": credit,
            "term": term,
            "lecturer": lecturer,
            "schedule": schedule,
            "description": courseDescription
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
