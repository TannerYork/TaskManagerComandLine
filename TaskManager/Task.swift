//
//  Task.swift
//  TaskManager
//
//  Created by Tanner York on 9/19/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
class Task {
    var title: String
    var detailsOfTask: String
    var completionStatus: Bool = false
    var completeByDate: Date?
    var priority: Int = 0 //default to 0 or no priority
    
    init(title: String, detailsOfTask: String, completionStaus: Bool, completByDate: Date?) {
        self.title = title
        self.detailsOfTask = detailsOfTask
        self.completionStatus = completionStaus
        self.completeByDate = completByDate
        if priority < 0 { //Makes sure the priority can never go below 0 and break code
            priority = 0
        }
    }
}

//Method for changing title
func changeTitle() {
    print("nothing here yet")
}

//Method for changing details
func changeDetails() {
    print("nothing here yet")
}

//Method for changing CompletionStatus
func changeCompletionStatus() {
    print("Nothing here yet")
}

//Method for setting priorities
func setPriority() {
    print("Nothing here yet")
}
