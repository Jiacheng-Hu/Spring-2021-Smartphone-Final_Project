//
//  CourseViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/24.
//

import UIKit
import Alamofire
import SwiftSpinner
import SwiftyJSON

class CourseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblCourse: UITableView!
    var courseArr: [CourseModel] = [CourseModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCourse.delegate = self
        tblCourse.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getCourseData(courseURL)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("CourseTableViewCell", owner: self, options: nil)?.first as! CourseTableViewCell
        cell.lblCRN.text = "\(courseArr[indexPath.row].crn)"
        cell.lblName.text = courseArr[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CourseItemViewController") as? CourseItemViewController
        vc?.crnTitle = "\(courseArr[indexPath.row].crn): \(courseArr[indexPath.row].title)"
        vc?.subject = "Subject: \(courseArr[indexPath.row].subject)"
        vc?.credit = "Credit: \(courseArr[indexPath.row].credit)"
        vc?.term = "Term: \(courseArr[indexPath.row].associatedTerm)"
        vc?.lecturer = "Lecturer: \(courseArr[indexPath.row].lecturer)"
        vc?.schedule = "Schedule: \(courseArr[indexPath.row].schedule)"
        vc?.courseDescription = "Description: \(courseArr[indexPath.row].description)"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func getCourseData(_ url: String) {
        SwiftSpinner.show("Getting course...")
        courseArr = [CourseModel]()
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in getting course data")
                return
            }
            guard let data = response.data else {return}
            let courseJson: [JSON] = JSON(data).arrayValue
            for index in courseJson {
                let crn = index["crn"].intValue
                let title = index["title"].stringValue
                let subject = index["subject"].stringValue
                let credit = index["credit"].intValue
                let term = index["associatedTerm"].stringValue
                let lecturer = index["lecturer"].stringValue
                let description = index["description"].stringValue
                let schedule = index["schedule"].stringValue
                let courseItem = CourseModel(crn, title, subject, credit, term, lecturer, description, schedule)
                self.courseArr.append(courseItem)
            }
            self.tblCourse.reloadData()
        }
    }

}
