//
//  SecondViewController.swift
//  To do list
//
//  Created by 小树王国 on 8/28/14.
//  Copyright (c) 2014 小树王国. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
    
   
                            
    @IBOutlet weak var toDoItem: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoItems.append(toDoItem.text)
        self.view.endEditing(true)// press button to close the keyboard
        let fixedtoDoItems = toDoItems //let creat immutable variables
        NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().synchronize()//synchronize save the data permantely
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()//click return to close keyboard
        
        return true
    }
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)//touch screen to close keyboard
    }

}

