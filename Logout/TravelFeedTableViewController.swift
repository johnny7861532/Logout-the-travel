//
//  TravelFeedTableViewController.swift
//  Logout
//
//  Created by Johnny' mac on 2016/3/28.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit
import Firebase

class TravelFeedTableViewController: UITableViewController {
    var travels = [Travel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // observeEventType is called whenever anything changes in the Firebase - new Jokes or Votes.
        // It's also called here in viewDidLoad().
        // It's always listening.
        DataService.dataService.TRAVEL_REF.observeEventType(.Value, withBlock:{ snapshot in
        // The snapshot is a current look at our travel data.
        
        print(snapshot.value)
        self.travels = []
            if let snapshots = snapshot.children.allObjects as?[FDataSnapshot]{
                for snap in snapshots{
                //make out travel array for the tableview.
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject>{
                    let key = snap.key
                    let travel = Travel(key: key, dictionary: postDictionary)
                 // Items are returned chronologically, but it's more fun with the newest travels first.
                    self.travels.insert(travel, atIndex: 0)
                    
                    }
                
                }
            }
            // Be sure that the tableView updates when there is new data.
            self.tableView.reloadData()
            })
            
        
        
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
        return travels.count
    }

    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let travel = travels[indexPath.row]
         // We are using a custom cell.
        if let cell = tableView.dequeueReusableCellWithIdentifier("TravelCellTableViewCell")as?TravelCellTableViewCell{
             // Send the single travel to configureCell() in TravelCellTableViewCell.
            cell.configureCell(travel)
            return cell
        }else {
            return TravelCellTableViewCell()
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
}