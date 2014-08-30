//
//  ViewController.swift
//  wtf
//
//  Created by 小树王国 on 8/20/14.
//  Copyright (c) 2014 小树王国. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var isPrime = true
    @IBOutlet weak var number: UITextField!
    @IBAction func buttonPressed(sender: AnyObject) {
        var Integer = number.text.toInt()
        
        if(Integer != nil) {
            if(Integer<1) {
                message.text = "please enter a positive number"
            }
            else{
                if(Integer == 1){
                    message.text = "1 is not a prime number"
                }
                else{
                    var n = sqrt(Double(Integer!))
                    for var i = 2; i <= Int(n); i++ {
                        if(Integer! % i==0){
                            
                            isPrime = false
                            
                        }
                    }
                    if(isPrime == true) {
                        message.text = "that number is prime"
                    }
                    else {
                        message.text = "that number is not prime"
                    }
                }
            }
            
        }
        else {
            message.text = "please enter a number"
        }
        println(number.text)
    }
    @IBOutlet weak var message: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

