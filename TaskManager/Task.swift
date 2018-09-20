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
        for int in (0...priority + 1) { //Adds a ! mark for the pirority number(This needs to be redone)
            self.title = title + "!"
        }
        if completByDate != nil {
            let compomentsOfDate = calendar.dateComponents([.year, .day, .month], from: completByDate!)
            if compomentsOfDate.day == 01 && compomentsOfDate.month == 12 {
               self.title = "\(self.title) 🎄"
            }
        }

        
        
    }
    
    
    //Method for changing title
    func changeTitle(to newTitle: String) {
        self.title = newTitle
    }
    
    //Method for changing details
    func changeDetails(to newDetails: String) {
        self.detailsOfTask = newDetails
    }
    
    //Method for changing CompletionStatus
    func changeCompletionStatus() {
        if completionStatus == false {
            completionStatus = true
        } else {
            completionStatus = false
        }
    }
    
    //Method for setting priorities
    func setPriority(to int: Int) {
        priority = int
    }
    
    //Method for chreating a date for the task
    func completionDate(_ input: String) {
        let newDate = dateFormatter.date(from: input) ?? nil
        self.completeByDate = newDate
    }
    
    //Method for printing date in correct format
    func CompletionDateFormated() -> String {
        let newDate: String
        dateFormatter.dateFormat = "MM/dd/yyyy"
        if completeByDate != nil {
             newDate = (dateFormatter.string(from: completeByDate!))
        } else {
            newDate = ""
        }
        return newDate
    }
    
    //Method for printing task details
    func printDetiasl() {
        print("""
             \(self.title)
            Title: \(self.title)
            Details: \(self.detailsOfTask)
            Completion Date: \(self.CompletionDateFormated())
            Priority: \(self.priority)
            """)
    }
    
    
}
