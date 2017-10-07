//
//  DeleteViewController.swift
//  Notes
//
//  Created by Mostafa on 7/17/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class DeleteViewController: UIViewController {
    
    var itemNote:NSDictionary = NSDictionary()
    @IBOutlet weak var titleNotes: UITextField!
    @IBOutlet weak var contentNotes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleNotes.userInteractionEnabled = false
        self.contentNotes.userInteractionEnabled = false
        self.titleNotes.text = self.itemNote.valueForKey("title") as? String
        self.contentNotes.text = self.itemNote.valueForKey("notes") as? String
        
    }
    
    @IBAction func Delete_btnClicked(sender: AnyObject) {
        
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let notesList:NSMutableArray?   = userDefault.objectForKey("noteslist") as? NSMutableArray
        if((notesList) != nil){// exist
            let newMutableArray:NSMutableArray = NSMutableArray()
            for dict:AnyObject in notesList! {
                newMutableArray.addObject(dict as! NSDictionary)
            }
            newMutableArray.removeObject(itemNote)
            userDefault.removeObjectForKey("noteslist")
            userDefault.setObject(newMutableArray, forKey: "noteslist")
            userDefault.synchronize()
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
    }
}
