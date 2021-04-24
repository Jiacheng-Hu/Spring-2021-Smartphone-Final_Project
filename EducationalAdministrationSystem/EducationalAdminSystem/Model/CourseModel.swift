//
//  CourseModel.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/22.
//

import Foundation

class CourseModel {
    
    var crn: Int
    var title: String
    var subject: String
    var credit: Int
    var associatedTerm: String
    var lecturer: String
    var description: String
    var schedule: String
    
    init(_ crn: Int, _ title: String, _ subject: String, _ credit: Int, _ associatedTerm: String, _ lecturer: String, _ description: String, _ schedule: String) {
        self.crn = crn
        self.title = title
        self.subject = subject
        self.credit = credit
        self.associatedTerm = associatedTerm
        self.lecturer = lecturer
        self.description = description
        self.schedule = schedule
    }
    
}
