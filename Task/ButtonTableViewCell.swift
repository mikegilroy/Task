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
    
    @IBAction func buttonTapped(sender: UIButton) {
    
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

extension ButtonTableViewCell {
    func updateWithTask (task: Task) {
        updateButton(task.isComplete)
        primaryLabel.text = task.name
    }
}
