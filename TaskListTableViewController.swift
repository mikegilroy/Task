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
}
