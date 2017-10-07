//
//  AddViewController.swift
//  Notes
//
//  Created by Mostafa on 7/17/17.
//  Copyright © 2017 Mostafa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleNotes: UITextField!
    @IBOutlet weak var ContentNotes: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Done_BtnClicked(sender: AnyObject) {
        
        if self.titleNotes.text == "" {
            
            let useralter = UIAlertController(title: "Please Fill Title Notes", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let OkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            useralter.addAction(OkAction)
            self.presentViewController(useralter, animated:true, completion: nil)
            
        }else if self.ContentNotes.text == "" {
            
            let useralter = UIAlertController(title: "Please Fill Body Notes", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let OkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
            useralter.addAction(OkAction)
            self.presentViewController(useralter, animated:true, completion: nil)
            
        }else{
            
            let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            var notesList:NSMutableArray?   = userDefault.objectForKey("noteslist") as? NSMutableArray
            let item:NSMutableDictionary = NSMutableDictionary()
            item.setValue(self.titleNotes.text, forKey: "title")
            item.setValue(self.ContentNotes.text, forKey: "notes")
            if((notesList) != nil){// exist
                let newMutableArray:NSMutableArray = NSMutableArray()
                for dict:AnyObject in notesList! {
                    newMutableArray.addObject(dict as! NSDictionary)
                }
                userDefault.removeObjectForKey("noteslist")
                newMutableArray.addObject(item)
                userDefault.setObject(newMutableArray, forKey: "noteslist")
            }else{ // not exist
                userDefault.removeObjectForKey("noteslist")
                notesList = NSMutableArray()
                notesList!.addObject(item)
                userDefault.setObject(notesList, forKey: "noteslist")
            }
            userDefault.synchronize()
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
    }
    
}
