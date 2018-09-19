//
//  Utilities.swift
//  TaskManager
//
//  Created by Tanner York on 9/19/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
let utitlities = Utilities() 
class Utilities {
    
    //Method for getting string input and makeing sure its usable
    func getStringInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" {
            print("Invaled Input")
            userInput = readLine()
        }
        return userInput!
    }
    
    //Method for getting integer intput and making sure its usable
    func getIntInput() -> Int {
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invaled Input")
            userInput = Int(readLine()!)
        }
        return userInput!
    }
    
    //Method for validating userInput
    func validateUserInputForTaskInTaskList(_ input: String) -> Bool {
        let validUserInput = Array(0..<taskList.taskList.count)
        guard let input = Int(input) else {
            return false
        }
        return validUserInput.contains(input)
    }
}
