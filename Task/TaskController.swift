//
//  TaskController.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class TaskController {
    static let sharedInstance = TaskController()
    var tasksArray = [Task]
    var completedTasksArray: [Task] {
        tasksArray.filter( {(task: Task) -> Bool in
            return task.isComplete
        })
    }
        var incompleteTasksArray: [Task] {
            tasksArray.filter( {(task: Task) -> Bool in
                return !task.isComplete
        })
    }

    var mockTasks: [Task] {
        let taskOne = Task(name: "Get Groceries", notes: "Milk, Bread", date: NSDate().dateByAddingTimeInterval(259200), isComplete: false)
        let taskTwo = Task(name: "Get Dry Cleaning", notes: "Extra Starch", date: nil, isComplete: true)
        let taskThree = Task(name: "Go to the Pub", notes: "", date: NSDate().dateByAddingTimeInterval(0), isComplete: false)
        return [taskOne, taskTwo, taskThree]
    }
    
    init() {
        self.tasksArray = self.mockTasks
    }
    
    func addTask (task:Task) {
        tasksArray.append(task)
    }

    func removeTask (task: Task) {
        let index = tasksArray.indexOf(task)
        self.tasksArray.removeAtIndex(index)
    }

}