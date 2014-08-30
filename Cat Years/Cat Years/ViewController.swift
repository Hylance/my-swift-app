//
//  ViewController.swift
//  Cat Years
//
//  Created by 小树王国 on 8/11/14.
//  Copyright (c) 2014 小树王国. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            

    @IBOutlet weak var catAge: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        var age = catAge.text.toInt()
        if (age != nil) {
            age = age! * 7 //age may not be exist, ! to override
            
            
            message.text = "Your cat is \(age!) cat years old."//insert a var into a string
        }
        else {
            message.text = "please enter a number of your cat age."
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

