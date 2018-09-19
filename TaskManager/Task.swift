//
//  Task.swift
//  TaskManager
//
//  Created by Tanner York on 9/18/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
class Task {
    var title: String
    var detailsOfTask: String
    var completionStatus: Bool = false
    var completeByDate: Date?
    var priority: Int
    init(title: String, detailsOfTask: String, completeByDate: Date?, priority: Int) {
        self.title = title
        self.detailsOfTask = detailsOfTask
        self.completeByDate = completeByDate
        self.priority = priority
    }
    
    //Method to change the tasks title
    func changeTitle() {
    print("Nothing here yet")
    }
    
    //Method to change the tasks detials
    func changeDetials() {
        print("Nothing here yet")
    }
    
    //Method to change the tasks completion status
    func changeCompletionStatus() {
        print("Nothing here yet")
    }
    
    //Method to change the task priority or add priority, default being 0
    func changePriority() {
        print("Nothing here yet")
    }
    
    //Method to add/change completion date
    func addCompletionDate() {
        print("Nothing here yet")
    }
    
    //Method to remove completion date
    func removeCompletionDate() {
        print("Nothing here yet")
    }
    
    //Method to add ! based on priority
    func addmark() {
    print("Nothing here yet")
    }
}
