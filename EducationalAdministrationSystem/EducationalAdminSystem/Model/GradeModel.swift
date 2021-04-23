//
//  GradeModel.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/22.
//

import Foundation

class GradeModel {
    
    var name: String
    var credit: Int
    var year: Int
    var semester: String
    var grade: String
    
    init(_ name: String, _ credit: Int, _ year: Int, _ semester: String, _ grade: String) {
        self.name = name
        self.credit = credit
        self.year = year
        self.semester = semester
        self.grade = grade
    }
    
}
