//
//  EntryCell.swift
//  Journal
//
//  Created by Ben Norris on 11/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

protocol EntryCellDelegate {
    func toggleEditing()
    func deleteEntry(cell: EntryCell)
}

class EntryCell: UICollectionViewCell {
    
    static let dateFormatter = NSDateFormatter()
    static let reuseIdentifier = "EntryCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var editing = false
    var delegate: EntryCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: "toggleEditing:")
        addGestureRecognizer(recognizer)
    }
    
    func update(entry: Entry) {
        titleLabel.text = entry.title
        contentLabel.text = entry.text
        timestampLabel.text = "\(entry.timestamp)"
        deleteButton.hidden = !editing
    }
    
    @IBAction func deleteCell(sender: AnyObject?) {
        delegate?.deleteEntry(self)
    }
    
    func toggleEditing(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .Began {
//            delegate?.toggleEditing()
            deleteButton.hidden = editing
        }
    }
    
}
