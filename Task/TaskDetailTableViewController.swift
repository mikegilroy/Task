//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var dueDateValue: String?
    var task: Task?
    
    @IBAction func datePickerValueChanged(sender: UIDatePicker) {
    let date = sender.date
        dueTextField.text = date.stringValue()
        dueDateValue = date.stringValue()
    }

    @IBAction func userTappedView(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        dueTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }

    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let task = self.task {
            TaskController.sharedInstance.removeTask(task)
        }
        let notes = notesTextView.text
        let date = dueDatePicker.date
        let name = nameTextField.text
        self.task = Task(name: name!, notes: notes, date: date, isComplete: false)
        TaskController.sharedInstance.addTask(self.task!)
        TaskController.sharedInstance.saveToPersistentStorage()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    func updateWithTasks (task: Task) {
      self.task = task
        
        title = task.name
        nameTextField.text = task.name
        
        if let due = task.date {
            dueTextField.text = due.stringValue()
        }
    
        if let notes = task.notes {
            notesTextView.text = notes
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    }
    
    override func viewDidLoad() {
        dueTextField.inputView = dueDatePicker
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.setToolbarHidden(false, animated: true)
    }
    
}
