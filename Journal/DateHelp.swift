//
//  DateHelp.swift
//  Journal
//
//  Created by Steve Cox on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

// THIS SECTION IS EXCLUSIVELY MYKE'S CREATION

import Foundation

extension NSDate {
    func formatDate() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle
        return formatter.stringFromDate(self)
    }
}
