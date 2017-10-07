//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Mostafa on 7/17/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var notesList:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let notesItems:NSMutableArray?   = userDefault.objectForKey("noteslist") as? NSMutableArray
        if((notesItems) != nil){
            self.notesList = notesItems!
        }
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "deletevc"{
            let deleteViewController:DeleteViewController = segue.destinationViewController as! DeleteViewController
            deleteViewController.itemNote = self.notesList.objectAtIndex((self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary
            
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notesList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let notesItem:NSDictionary = self.notesList.objectAtIndex(indexPath.row) as! NSDictionary
        cell.textLabel?.text = notesItem.valueForKey("title") as? String
        return cell
    }
}
