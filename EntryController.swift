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
    
    private let keyEntries = "storedEntries"
    
    init() {
        loadFromPersistentStorage()
    }
    
    // CRUD - create, read, update, delete
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        if let index = entries.indexOf(entry) {
            entries.removeAtIndex(index)
            saveToPersistentStorage()
        }
    }
    
    func saveToPersistentStorage() {
        NSUserDefaults.standardUserDefaults().setObject(entries.map{$0.dictionaryCopy}, forKey: keyEntries)
        
    }
    
    func loadFromPersistentStorage() {
        guard let entriesDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(keyEntries) as? [[String:AnyObject]] else {
            return
        }
        entries = entriesDictionaryArray.flatMap{Entry(dictionary: $0)}
    }
    
    
    
}
