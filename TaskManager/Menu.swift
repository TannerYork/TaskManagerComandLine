//
//  Menu.swift
//  TaskManager
//
//  Created by Tanner York on 9/19/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
class Menu {
    //Method to print menu
    func printMenu() {
        for task in taskList.sortByPriority() {
            if task.completionStatus == false {
                print("\(task.title)")
            }
            if task.completionStatus == true {
                print("\(task.title) ✔︎")
            }
        }
        print("\n\n")
        print("""
         Options


""")
    }
}
