//
//  Entry.swift
//  Journal
//
//  Created by Steve Cox on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var dictionaryCopy: [String:AnyObject] {
        return [keyTitle:title, keyBody:body]
    }
    
    private let keyTitle = "title"
    private let keyBody = "body"
    
    let timestamp: NSDate = NSDate()
    var title: String
    var body: String
    
    init(timestamp: NSDate, title: String, body: String){
        self.title = title
        self.body = body
    }
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[keyTitle] as? String, body = dictionary[keyBody] as? String else { return nil }
        self.title = title
        self.body = body
    }
    
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && rhs.body == rhs.body
    
}




