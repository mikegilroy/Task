//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit
import Foundation

class TaskListTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        let currentTask = TaskController.sharedInstance.tasksArray[indexPath.row]
        cell.textLabel?.text = currentTask.name
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasksArray.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            TaskController.sharedInstance.tasksArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editTaskDetail" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let task = TaskController.sharedInstance.tasksArray[selectedIndexPath.row]
                
                if let taskDetailScene = segue.destinationViewController as? TaskDetailTableViewController {
                    
                    _ = taskDetailScene.view
                    taskDetailScene.updateWithTasks(task)
                }
            }
        }
    }
}


