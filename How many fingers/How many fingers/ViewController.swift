//
//  ViewController.swift
//  How many fingers
//
//  Created by 小树王国 on 8/13/14.
//  Copyright (c) 2014 小树王国. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var guess: UITextField!

    @IBOutlet weak var message: UILabel!
    @IBAction func guessButton(sender: AnyObject) {
        var numberOfFingers = arc4random() % 6
        println(numberOfFingers)
        var numberOfFingersString=String(numberOfFingers)
        
        if (numberOfFingersString == guess.text) {
            message.text = "You get it right"
        }
        else  {
            if (numberOfFingers == 1 || numberOfFingers == 0) {
                message.text = "That wasn't right. I was holding up \(numberOfFingers) finger. Try again!"
                
            }
            else {
                
                message.text = "That wasn't right. I was holding up \(numberOfFingers) fingers. Try again!"
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

