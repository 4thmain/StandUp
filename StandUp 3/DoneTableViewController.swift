//
//  DoneTableViewController.swift
//  StandUp 3
//
//  Created by Shankar Narayan on 21/01/16.
//  Copyright © 2016 4thMain. All rights reserved.
//

import UIKit

class DoneTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("it worked")
        
        
        if NSUserDefaults.standardUserDefaults().objectForKey("done") != nil {
            
            done = NSUserDefaults.standardUserDefaults().objectForKey("done") as! [String]
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
        return done.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let doneCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "doneCell")
        doneCell.textLabel?.text = done[indexPath.row]
        return doneCell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let archiveAction = UITableViewRowAction(style: .Normal, title: "Archive") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            let currenttodo = done[indexPath.row]
            
            done.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(done, forKey: "done")
            todolist.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
        return[archiveAction]
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
