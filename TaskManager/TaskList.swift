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
                @@ Enter taskComplete to finish the
                new task @@
                """)
        }
        var finishTask = false
        newTask: while !finishTask {
            printCurrentTask()
            let userInput = Utilities.getStringInput()
            switch userInput {
            case "title":
                print("Enter new title")
                var newTitle = Utilities.getStringInput()
                for task in taskList { //Makes sure there are no duplicats so the print task details work for all the task, even if they have the same title.
                    if newTitle == task.title {
                        newTitle.append("*")
                    }
                }
                newTask.changeTitle(to: newTitle)
            case "details":
                print("Enter detials of task")
                let newDetails = Utilities.getStringInput()
                newTask.changeDetails(to: newDetails)
            case "completion date":
                print("Enter a date for task to be completed by, MM/dd/yyyy")
                let newDate = Utilities.getStringInput()
                newTask.completionDate(newDate)
                if newTask.completeByDate != nil { //This chesks in completion date is nil and if it is not it checks if the date is christmas day and if it is then it adds a tree and if its not it checks in there is a tree in the title and if there is it removes it.
                    let compomentsOfDate = calendar.dateComponents([.year, .day, .month], from: newTask.completeByDate!)
                    if compomentsOfDate.day == 25 && compomentsOfDate.month == 12 {
                        newTask.title.append("🎄")
                    } else if newTask.title.contains("🎄") {
                        let index = newTask.title.firstIndex(of: "🎄")
                        for character in newTask.title {
                            if character == "🎄" {
                                newTask.title.remove(at: index!)
                            }
                        }
                    }
                }
            case "priority":
                print("Enter priority, 1-10")
                let priorityLevel = Utilities.getIntInput()
                newTask.setPriority(to: priorityLevel)
                if newTask.priority > 0 { //This does the same as the tree exept its based on priority.
                for _ in 0..<newTask.priority {
                    newTask.title.append("!")
                }
                } else if newTask.priority == 0 {
                    let index = newTask.title.firstIndex(of: "!")
                    for character in newTask.title {
                        if character == "!" {
                            newTask.title.remove(at: index!)
                        }
                    }
                }
            case "taskComplete":
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
    
    //Method for the details option
    func details() {
        print("What task do you want the details for?")
        let detailsOf = readLine()
        for task in taskList {
            if detailsOf ==  task.title {
                print("\n ")
                print("""
                    \(task.title)
                    Title: \(task.title)
                    Details: \(task.detailsOfTask)
                    Completion Date: \(task.CompletionDateFormated())
                    Priority: \(task.priority)
                    """)
                break
            }
        }
    }
    
    
    //Method for editing task
    func editTask() {
        print("What task do you want to edit?")
        var taskToBeEditied = readLine()
        for task in taskList {
            if taskToBeEditied == task.title {
                func printCurrentTask() {
                    print("\n ")
                    print("""
                        Current Task
                        Title: \(task.title)
                        Details: \(task.detailsOfTask)
                        Completion Date: \(task.CompletionDateFormated())
                        Priority: \(task.priority)
                        @@ Enter taskComplete to finish
                        the edit @@
                        """)
                }
                var finishTask = false
                editTask: while !finishTask {
                    printCurrentTask()
                    let userInput = Utilities.getStringInput()
                    switch userInput {
                    case "title":
                        print("Enter new title")
                        var newTitle = Utilities.getStringInput()
                        for task in taskList { //Makes sure there are no duplicats so the print task details work for all the task, even if they have the same title.
                            if newTitle == task.title {
                                newTitle.append("*")
                            }
                        }
                        task.changeTitle(to: newTitle)
                    case "details":
                        print("Enter detials of task")
                        let newDetails = Utilities.getStringInput()
                        task.changeDetails(to: newDetails)
                    case "completion date":
                        print("Enter a date for task to be completed by, MM/dd/yyy")
                        let newDate = Utilities.getStringInput()
                        task.completionDate(newDate)
                        let compomentsOfDate = calendar.dateComponents([.year, .day, .month], from: task.completeByDate!)
                        if compomentsOfDate.day == 25 && compomentsOfDate.month == 12 {
                            task.title.append("🎄")
                        } else if task.title.contains("🎄") {
                            let index = task.title.firstIndex(of: "🎄")
                            for character in task.title {
                                if character == "🎄" {
                                    task.title.remove(at: index!)
                                }
                            }
                        }
                    case "priority":
                        print("Enter priority, 1-10")
                        let priorityLevel = Utilities.getIntInput()
                        task.setPriority(to: priorityLevel)
                        if task.priority > 0 {
                            for _ in 0..<task.priority {
                                task.title.append("!")
                            }
                        } else if task.priority == 0 {
                            let index = task.title.firstIndex(of: "!")
                            for character in task.title {
                                if character == "!" {
                                    task.title.remove(at: index!)
                                }
                            }
                        }
                    case "taskComplete":
                        print("Are you sure you are done? Y/N")
                        var userInput = Utilities.getStringInput()
                        switch userInput {
                        case "Y":
                            finishTask = true
                        case "N":
                            continue editTask
                        default:
                            print("/n ")
                            print("Invaled Input")
                            userInput = Utilities.getStringInput()
                        }
                    default:
                        print("\n ")
                        print("Invaled Input")
                        print("\n ")
                        continue editTask
                    }
                }
            }
        }
    }
}

