//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!

    func updateWithTasks (task: Task) {
        nameTextField.text = task.name
        dueTextField.text = String(task.date)
        notesTextView.text = task.notes
    }
    
}
