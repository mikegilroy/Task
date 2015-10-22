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

    func addTask (task:Task) {
        tasksArray.append(task)
    }

    func removeTask (task: Task) {
        let index = tasksArray.indexOf(task)
        self.tasksArray.removeAtIndex(index)
    }

}