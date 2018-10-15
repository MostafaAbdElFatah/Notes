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
        self.titleNotes.isUserInteractionEnabled = false
        self.contentNotes.isUserInteractionEnabled = false
        self.titleNotes.text = self.itemNote.value(forKey: "title") as? String
        self.contentNotes.text = self.itemNote.value(forKey: "notes") as? String
        
    }
    
    @IBAction func Delete_btnClicked(sender: AnyObject) {
        
        let userDefault:UserDefaults = UserDefaults.standard
        let notesList:NSMutableArray?   = userDefault.object(forKey: "noteslist") as? NSMutableArray
        if((notesList) != nil){// exist
            let newMutableArray:NSMutableArray = NSMutableArray()
            for dict:Any in notesList! {
                newMutableArray.add(dict as! NSDictionary)
            }
            newMutableArray.remove(itemNote)
            userDefault.removeObject(forKey: "noteslist")
            userDefault.set(newMutableArray, forKey: "noteslist")
            userDefault.synchronize()
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
}
