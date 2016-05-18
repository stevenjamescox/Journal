//
//  EntryController.swift
//  Journal
//
//  Created by Steve Cox on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedController = EntryController()
    
    var entries: [Entry] = []
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
    }
    
    func removeEntry(entry: Entry) {
        
        if let index = entries.indexOf(entry) {
            entries.removeAtIndex(index)
        }
        
    }
    
    
    
}
