//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        delegate?.buttonCellButtonTapped(self)
        
    }
    
    func updateButton (isComplete: Bool) {
        if isComplete {
            button.setBackgroundImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button.setBackgroundImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}


extension ButtonTableViewCell {
    func updateWithTask (task: Task) {
        updateButton(task.isComplete.boolValue)
        primaryLabel.text = task.name
    }
}
