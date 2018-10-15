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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefault:UserDefaults = UserDefaults.standard
        let notesItems:NSMutableArray?   = userDefault.object(forKey: "noteslist") as? NSMutableArray
        if((notesItems) != nil){
            self.notesList = notesItems!
        }
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "deletevc"{
            let deleteViewController:DeleteViewController = segue.destination as! DeleteViewController
            deleteViewController.itemNote = self.notesList.object(at: (self.tableView.indexPathForSelectedRow?.row)!) as! NSDictionary
            
        }
    }
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let notesItem:NSDictionary = self.notesList.object(at: indexPath.row) as! NSDictionary
        cell.textLabel?.text = notesItem.value(forKey: "title") as? String
        return cell
    }
}









