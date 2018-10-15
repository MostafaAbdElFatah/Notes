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
    
    @IBAction func Done_BtnClicked(_ sender: AnyObject) {
        
        if self.titleNotes.text == "" {
            
            let useralter = UIAlertController(title: "Please Fill Title Notes", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let OkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            useralter.addAction(OkAction)
            self.present(useralter, animated:true)
            
        }else if self.ContentNotes.text == "" {
            
            let useralter = UIAlertController(title: "Please Fill Body Notes", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let OkAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
            useralter.addAction(OkAction)
            self.present(useralter, animated:true)
            
        }else{
            
            let userDefault:UserDefaults = UserDefaults.standard
            var notesList:NSMutableArray?   = userDefault.object(forKey: "noteslist") as? NSMutableArray
            let item:NSMutableDictionary = NSMutableDictionary()
            item.setValue(self.titleNotes.text, forKey: "title")
            item.setValue(self.ContentNotes.text, forKey: "notes")
            if((notesList) != nil){// exist
                let newMutableArray:NSMutableArray = NSMutableArray()
                for dict:Any in notesList! {
                    newMutableArray.add(dict as! NSDictionary)
                }
                userDefault.removeObject(forKey: "noteslist")
                newMutableArray.add(item)
                userDefault.set(newMutableArray, forKey: "noteslist")
            }else{ // not exist
                userDefault.removeObject(forKey: "noteslist")
                notesList = NSMutableArray()
                notesList!.add(item)
                userDefault.set(notesList, forKey: "noteslist")
            }
            userDefault.synchronize()
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
}
