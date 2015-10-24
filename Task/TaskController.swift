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
    static let taskKey = "taskKey"
    var tasksArray = [Task]()
    var completedTasksArray: [Task] {
        return tasksArray.filter( {(task: Task) -> Bool in
        return task.isComplete
        })
    }
        var incompleteTasksArray: [Task] {
            return tasksArray.filter( {(task: Task) -> Bool in
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
        loadFromPersistentStorage()
    }
    
    func addTask(task: Task) {
        tasksArray.append(task)
        saveToPersistentStorage()
    }

    func removeTask(task: Task) {
        let index = tasksArray.indexOf(task)
        self.tasksArray.removeAtIndex(index!)
        saveToPersistentStorage()
    }

    func saveToPersistentStorage () {
        NSKeyedArchiver.archiveRootObject(self.tasksArray, toFile: self.filePath(TaskController.taskKey))
    }
    
    func loadFromPersistentStorage () {
        if let tasks = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(TaskController.taskKey)) {
            self.tasksArray = tasks as! [Task]
        }
    }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}