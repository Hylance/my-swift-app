//
//  FirstViewController.swift
//  To do list
//
//  Created by 小树王国 on 8/28/14.
//  Copyright (c) 2014 小树王国. All rights reserved.
//

import UIKit

 var toDoItems:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tasksTable:UITableView!//to control table view in view controler
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems.count//number of cell
        
        
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        
    var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel.text = toDoItems[indexPath.row]//let table view show items
        
        
        
        return cell
        
    }
    
    override func viewWillAppear(animated: Bool) {//refresh data when new item added
        
        if var storedtoDoItems:AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems"){
            toDoItems = []
            for var i = 0; i < storedtoDoItems.count; ++i {
             
                toDoItems.append(storedtoDoItems[i] as NSString)//convert anyobject to string
            }
        }
        
        tasksTable.reloadData()
    }
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){//people try to delete some items
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            toDoItems.removeAtIndex(indexPath.row)
            //update permantely stored items after deleting
            let fixedtoDoItems = toDoItems //let creat immutable variables
            NSUserDefaults.standardUserDefaults().setObject(fixedtoDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()//synchronize save the data permantely
            tasksTable.reloadData()
            

        }
        
        
    }
    
    
    


}

