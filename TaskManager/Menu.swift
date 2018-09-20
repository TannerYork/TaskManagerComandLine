//
//  Menu.swift
//  TaskManager
//
//  Created by Tanner York on 9/19/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
let menu = Menu()
class Menu {
    
    //Method for runing program
    func go() {
        var applicationRunning = true
        while applicationRunning {
            printMenu()
            let userInput = Utilities.getStringInput()
            for index in 0..<taskList.taskList.count {
                if userInput == taskList.taskList[index].title {
                    taskList.taskList[index].changeCompletionStatus()
                }
            }
            handleUserInput(userInput)
        }
    }
    
    
    
    //Method to print menu
    func printMenu() {
        print("\n")
        for task in taskList.sortByPriority() {
            if task.completionStatus == false {
                print("\(task.title)")
            }
            if task.completionStatus == true {
                print("\(task.title) ✔︎")
            }
        }
        print("\n")
        print("""
Options:
- Add Task
- Remove Task
- List Completed Task
- List Uncompleted Task
- Details (Class Title)
- Quit
@@ To mark a task complete or incomplete just enter the title of the task @@


""")
    }
    
    //Method for handling user input for the menu
    func handleUserInput(_ input: String) {
        switch input {
        case "add task": //Run program for creating a new task
            taskList.addTask()
        case "remove task": //Run program for removing a task
            taskList.removeTask()
        case "completed task": //Run program for listing only completed task
            taskList.printCompletedTask()
        case "uncompeted task": //Run program for listing only uncompleted task
            taskList.printUncompletedTask()
        case "quit": //Run program for leavign the aplication
            print("Nothing here yet")
        default:
            print("Invaled Input")
            
        }
    }
    
    //Method for exiting the aplication
    func quit() {
        
    }
}
