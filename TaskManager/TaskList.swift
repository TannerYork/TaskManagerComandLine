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
        let sortedTaskList = taskList.sorted(by: { $0.priority > $1.priority })
        return sortedTaskList
    }
    
    //Method for listing completed tasks
    func printCompletedTask() {
        for task in taskList {
            if task.completionStatus == true {
                print("\(task.title) ✔︎")
            }
        }
    }
    
    //Method for listing uncompleted tasks
    func printUncompletedTask() {
        for task in taskList {
            if task.completionStatus == false {
                print("\(task.title)")
            }
        }
    }
    
    //Method to remove task
    func removeTask() {
        print("\n ")
        print("Enter the task order number, starting from the top adn going down.")
        let userInput = Utilities.getIntInput()
        for index in Array(0..<taskList.count) {
            if userInput == index {
                print("Are you sure you want to remove \(taskList[userInput].title)?")
                let comfirmRemove = Utilities.getStringInput()
                switch comfirmRemove {
                case "Y":
                    taskList.remove(at: userInput)
                case "N":
                    break
                default:
                    break
                }
            } else {
                print("Invaled Input, not a task index.")
            }
        }
        
    }
    
    //Method to add task
    func addTask() {
        //Initial new game with the title entered
        var newTask = Task(title: "None", detailsOfTask: "None", completionStaus: false, completByDate: nil)
        func printCurrentTask() {
            print("\n ")
            print("""
                New Task
                Title: \(newTask.title)
                Details: \(newTask.detailsOfTask)
                Completion Date: \(newTask.CompletionDateFormated())
                Priority: \(newTask.priority)
                """)
        }
        var finishTask = false
        newTask: while !finishTask {
            printCurrentTask()
            let userInput = Utilities.getStringInput()
            switch userInput {
            case "title".uppercased():
                print("Enter new title")
                let newTitle = Utilities.getStringInput()
                newTask.changeTitle(to: newTitle)
            case "details".uppercased():
                print("Enter detials of task")
                let newDetails = Utilities.getStringInput()
                newTask.changeDetails(to: newDetails)
            case "date".uppercased():
                print("Enter a date for task to be completed by, MM/dd/yyy")
                let newDate = Utilities.getStringInput()
                newTask.completionDate(newDate)
            case "priority".uppercased():
                print("Enter priority, 1-10")
                let priorityLevel = Utilities.getIntInput()
                newTask.setPriority(to: priorityLevel)
            case "taskComplete".uppercased():
                print("Are you sure you are done? Y/N")
                var userInput = Utilities.getStringInput()
                switch userInput {
                case "Y":
                    taskList.append(newTask)
                    finishTask = true
                case "N":
                    continue newTask
                default:
                    print("/n ")
                    print("Invaled Input")
                    userInput = Utilities.getStringInput()
                }
            default:
                print("\n ")
                print("Invaled Input")
                print("\n ")
                continue newTask
            }
        }
        
        
    }
    
    
    
}
