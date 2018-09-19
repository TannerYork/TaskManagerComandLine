//
//  TaskList.swift
//  TaskManager
//
//  Created by Tanner York on 9/19/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
let taskList = TaskList()
class TaskList {
    var taskList: [Task] = []
    
    //Method for aranging task based on priority
    func sortByPriority() -> [Task] {
       var sortedTaskList = taskList.sorted(by: { $0.priority > $1.priority })
        return sortedTaskList
    }
    
    //Method to add task
    func addTask() {
        print("Nothing here yet")
    }
    
    //Method to remove task
    func removeTask() {
        print("Nothing here yet")
    }
    
    //Method to
}

