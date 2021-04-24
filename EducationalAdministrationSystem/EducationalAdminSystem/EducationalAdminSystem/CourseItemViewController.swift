//
//  CourseItemViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/24.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = crnTitle
        lblSubject.text = subject
        lblCredit.text = credit
        lblTerm.text = term
        lblLecturer.text = lecturer
        lblSchedule.text = schedule
        lblDescription.text = courseDescription
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
    }
    
    func didExistInDB(crn: Int) -> Bool {
        return false
    }
    

}
