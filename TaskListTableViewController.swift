//
//  TaskListTableViewController.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit
import Foundation

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    
    func buttonCellButtonTapped(sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPathForCell(sender) else {return}
        let task = TaskController.sharedInstance.tasksArray[indexPath.row]
        if task.isComplete {
            task.isComplete = false
        } else {
            task.isComplete = true
        }
        TaskController.sharedInstance.saveToPersistentStorage()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as! ButtonTableViewCell
        let currentTask = TaskController.sharedInstance.tasksArray[indexPath.row]
        cell.delegate = self
        cell.updateWithTask(currentTask)
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasksArray.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            TaskController.sharedInstance.tasksArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            TaskController.sharedInstance.saveToPersistentStorage()
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
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
}