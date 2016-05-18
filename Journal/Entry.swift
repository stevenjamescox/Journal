//
//  Entry.swift
//  Journal
//
//  Created by Steve Cox on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    let timestamp: NSDate
    let title: String
    let body: String
    
    init(timestamp: NSDate, title: String, body: String){
        self.timestamp = timestamp
        self.title = title
        self.body = body
        
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && rhs.body == rhs.body
    
}




