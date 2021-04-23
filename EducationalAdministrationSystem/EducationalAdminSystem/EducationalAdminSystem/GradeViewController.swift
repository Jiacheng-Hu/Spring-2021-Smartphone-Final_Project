//
//  GradeViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/23.
//

import UIKit
import Alamofire
import SwiftSpinner
import SwiftyJSON

class GradeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblGrade: UITableView!
    
    var gradeArr: [GradeModel] = [GradeModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblGrade.delegate = self
        tblGrade.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getGradeData(gradeURL)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gradeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("GradeTableViewCell", owner: self, options: nil)?.first as! GradeTableViewCell
        cell.lblName.text = gradeArr[indexPath.row].name
        cell.lblCredit.text = "\(gradeArr[indexPath.row].credit)"
        cell.lblYear.text = "\(gradeArr[indexPath.row].year)"
        cell.lblSemester.text = gradeArr[indexPath.row].semester
        cell.lblGrade.text = gradeArr[indexPath.row].grade
        return cell
    }
    
    func getGradeData(_ url: String) {
        SwiftSpinner.show("Getting your grades...")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in getting grades")
                return
            }
            guard let data = response.data else {return}
            let gradeJson: [JSON] = JSON(data).arrayValue
            for index in gradeJson {
                let name = index["name"].stringValue
                let credit = index["credit"].intValue
                let year = index["year"].intValue
                let semester = index["semester"].stringValue
                let grade = index["grade"].stringValue
                let gradeItem = GradeModel(name, credit, year, semester, grade)
                self.gradeArr.append(gradeItem)
            }
            self.tblGrade.reloadData()
        }
    }
    
    

}
