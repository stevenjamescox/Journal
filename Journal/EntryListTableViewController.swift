//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Steve Cox on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.sharedController.entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        let entry = EntryController.sharedController.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp.formatDate()
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let entry = EntryController.sharedController.entries[indexPath.row]
            EntryController.sharedController.removeEntry(entry)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toAddEntry" {
            
        } else if segue.identifier == "toEditEntry" {
            let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                let entry = EntryController.sharedController.entries[indexPath.row]
                entryDetailViewController?.entry = entry
            }
        }
    }
}