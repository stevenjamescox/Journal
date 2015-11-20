//
//  EntryCollectionViewController.swift
//  Journal
//
//  Created by Ben Norris on 11/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EntryCollectionViewController: UICollectionViewController, EntryCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EntryController.sharedController.entries.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(EntryCell.reuseIdentifier, forIndexPath: indexPath) as? EntryCell else { preconditionFailure() }
        let entry = EntryController.sharedController.entries[indexPath.item]
        cell.delegate = self
        cell.editing = editing
        cell.update(entry)
    
        // Configure the cell
    
        return cell
    }
    
    // MARK: - Entry Cell Delegate
    
    func toggleEditing() {
        editing = !editing
        collectionView?.reloadData()
    }
    
    func deleteEntry(cell: EntryCell) {
        guard let indexPath = collectionView?.indexPathForCell(cell) else { preconditionFailure() }
        let entry = EntryController.sharedController.entries[indexPath.item]
        EntryController.sharedController.removeEntry(entry)
        collectionView?.deleteItemsAtIndexPaths([indexPath])
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
