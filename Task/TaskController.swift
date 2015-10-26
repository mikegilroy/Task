//
//  TaskController.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static let sharedInstance = TaskController()
    static let taskKey = "taskKey"
    var tasksArray: [Task] {
        let request = NSFetchRequest(entityName: "Task")
        let moc = Stack.sharedStack.managedObjectContext

        do {
            return try moc.executeFetchRequest(request) as! [Task]
        } catch {
            return []
        }
    }
    var completedTasksArray: [Task] {
        return tasksArray.filter({$0.isComplete.boolValue})

    }
        var incompleteTasksArray: [Task] {
            return tasksArray.filter({!$0.isComplete.boolValue})
    }

    func addTask(task: Task) {
        saveToPersistentStorage()
    }

    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.deleteObject(task)
        }
        saveToPersistentStorage()
    }

    func saveToPersistentStorage () {
        let moc = Stack.sharedStack.managedObjectContext
            do {
                try moc.save()
            } catch {
                print("error saving")
            }
        }
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entriesPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entriesPath
    }
}