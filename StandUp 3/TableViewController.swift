//
//  TableViewController.swift
//  StandUp 3
//
//  Created by Shankar Narayan on 20/01/16.
//  Copyright © 2016 4thMain. All rights reserved.
//
import Foundation
import UIKit

var todolist = [String]()
var done = [String]()

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todolist") != nil {
            
            todolist = NSUserDefaults.standardUserDefaults().objectForKey("todolist") as! [String]
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todolist.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = todolist[indexPath.row]
        return cell
    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            todolist.removeAtIndex(indexPath.row)
//            NSUserDefaults.standardUserDefaults().setObject(todolist, forKey: "todolist")
//            tableView.reloadData()
//        }
//    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let doneAction = UITableViewRowAction(style: .Normal, title: "Done") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            let currenttodo = todolist[indexPath.row]
            done.append(currenttodo)
            NSUserDefaults.standardUserDefaults().setObject(done, forKey: "done")
            todolist.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        
        let deleteAction = UITableViewRowAction(style: .Destructive, title: "Delete") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            todolist.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todolist, forKey: "todolist")
            tableView.reloadData()
        }
    
        doneAction.backgroundColor = UIColor(red: 41.0/255, green: 171.0/255, blue: 226.0/255, alpha: 1.0)
        return[deleteAction,doneAction]

    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
