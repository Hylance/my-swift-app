//
//  ViewController.swift
//  What's the Weather
//
//  Created by 小树王国 on 8/29/14.
//  Copyright (c) 2014 小树王国. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var city: UITextField!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        var urlString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        var url = NSURL(string:urlString)
        //download data from web
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){(data, response, error) in
            
            //encoding data to be readable
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            if(urlContent.containsString("<span class=\"phrase\">")){
            //split the string to find the weather data
            var contentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">") //back slash to disable "
            var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
            self.message.text = (newContentArray[0]as String).stringByReplacingOccurrencesOfString("&deg;", withString: "º")//use self in closure and cast it to string
            } else{
            
            self.message.text = "Couldn't find that city--please try again"
            
            }
        }
        task.resume()
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

