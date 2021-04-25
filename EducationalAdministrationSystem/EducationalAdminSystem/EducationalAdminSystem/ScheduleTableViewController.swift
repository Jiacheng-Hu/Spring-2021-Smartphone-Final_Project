//
//  ScheduleTableViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/25.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    
    var courseArr: [CourseModel] = [CourseModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ScheduleTableViewCell", owner: self, options: nil)?.first as! ScheduleTableViewCell
        cell.lblCRN.text = courseArr[indexPath.row].crn
        cell.lblTitle.text = courseArr[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
