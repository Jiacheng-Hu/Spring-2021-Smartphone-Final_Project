//
//  EventsModel.swift
//  EducationalAdminSystem
//
//  Created by 胡嘉诚 on 2021/4/22.
//

import Foundation

class EventsModel {
    
    var title: String
    var text: String
    var department: String
    var displayTime: String
    
    init(_ title: String, _ text: String, _ department: String, _ displayTime: String) {
        self.title = title
        self.text = text
        self.department = department
        self.displayTime = displayTime
    }
    
}
