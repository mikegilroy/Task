//
//  Task.swift
//  Task
//
//  Created by Paul Kirk Adams on 10/22/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding {
    var name: String
    var notes: String?
    var date: NSDate?
    var isComplete: Bool

    struct PropertyKey {
        static let nameKey = "name"
        static let notesKey = "notes"
        static let dateKey = "date"
        static let isCompleteKey = "isComplete"
    }

    init(name: String, notes: String?, date: NSDate?, isComplete: Bool) {
        self.name = name
        self.notes = notes
        self.date = date
        self.isComplete = isComplete
    }

    @objc required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let notes = aDecoder.decodeObjectForKey(PropertyKey.notesKey) as? String
        let date = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as? NSDate
        let isComplete = aDecoder.decodeObjectForKey(PropertyKey.isCompleteKey) as! Bool
        self.init(name: name, notes: notes, date: date, isComplete: isComplete)
    }

    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(notes, forKey: PropertyKey.notesKey)
        aCoder.encodeObject(date, forKey: PropertyKey.dateKey)
        aCoder.encodeObject(isComplete, forKey: PropertyKey.isCompleteKey)
    }
    
}
