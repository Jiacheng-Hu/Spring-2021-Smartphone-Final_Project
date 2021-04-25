//
//  ScheduleViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/25.
//

import UIKit
import Firebase
import SwiftSpinner

class ScheduleViewController: UIViewController {
    
    var db: Firestore!
    
    var courseArr: [CourseModel] = [CourseModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    @IBAction func checkCourseAction(_ sender: UIButton) {
        courseArr = [CourseModel]()
        SwiftSpinner.show("Getting course schedule...")
        db.collection("courses").getDocuments { (querySnapshot, error) in
            SwiftSpinner.hide()
            if let error = error {
                print("Error getting documents: \(error)")
            } else if querySnapshot!.documents.count == 0 {
                self.performSegue(withIdentifier: "emptySegue", sender: self)
            } else {
                for document in querySnapshot!.documents {
                    let crn = document.data()["crn"] as! String
                    let title = document.data()["title"] as! String
                    let subject = document.data()["subject"] as! String
                    let credit = document.data()["credit"] as! Int
                    let term = document.data()["term"] as! String
                    let lecturer = document.data()["lecturer"] as! String
                    let schedule = document.data()["schedule"] as! String
                    let description = document.data()["description"] as! String
                    
                    let course = CourseModel(crn, title, subject, credit, term, lecturer, description, schedule)
                    self.courseArr.append(course)
                }
                self.performSegue(withIdentifier: "getCourseSegue", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getCourseSegue" {
            let vc = segue.destination as! ScheduleTableViewController
            vc.courseArr = courseArr
        }
    }
    
}
