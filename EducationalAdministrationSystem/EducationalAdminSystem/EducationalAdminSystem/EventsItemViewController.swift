//
//  EventsItemViewController.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/24.
//

import UIKit

class EventsItemViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblDept: UILabel!
    
    var titles = ""
    var time = ""
    var text = ""
    var dept = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = titles
        lblTime.text = time
        lblText.text = text
        lblDept.text = "Department: \(dept)"
    }

}
