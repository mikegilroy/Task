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

    func updateWithTasks (task: Task) {
        nameTextField.text = task.name
        dueTextField.text = task.date?.stringValue()
        notesTextView.text = task.notes
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    }
    
    override func viewDidLoad() {
        dueTextField.inputView = dueDatePicker
    }
    
}
