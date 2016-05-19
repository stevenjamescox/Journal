//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Steve Cox on 5/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    @IBOutlet weak var entryBodyTextField: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entry = entry {
            updateWithEntry(entry)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action Buttons
    
    func updateWithEntry(entry: Entry) {
        self.navigationItem.title = entry.title
        entryTitleTextField.text = entry.title
        entryBodyTextField.text = entry.body
    }
    
    @IBAction func clearTextButton(sender: AnyObject) {
        entryTitleTextField.text = ""
        entryBodyTextField.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func saveButton(sender: AnyObject) {
        if let entry = entry {
            entry.title = entryTitleTextField.text ?? ""
            entry.body = entryBodyTextField.text ?? ""
            EntryController.sharedController.saveToPersistentStorage()
        } else {
            let entry: Entry = Entry(timestamp: NSDate(), title: entryTitleTextField.text ?? "", body: entryBodyTextField.text ?? "")
            EntryController.sharedController.addEntry(entry)
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}
