//
//  GradeTableViewCell.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/23.
//

import UIKit

class GradeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblSemester: UILabel!
    @IBOutlet weak var lblGrade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
