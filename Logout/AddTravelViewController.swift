//
//  AddTravelViewController.swift
//  Logout
//
//  Created by Johnny' mac on 2016/3/27.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit
import Firebase

class AddTravelViewController: UIViewController {
   var currentUsername = ""
    @IBOutlet weak var locationField: UITextField!

    @IBOutlet weak var travelarticleFied: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get username of the current user, and set it to currentUsername, so we can add it to the Travel.\
        DataService.dataService.CURRENT_USER_REF.observeEventType(FEventType.Value, withBlock: { snapshot in
        let currentUser = snapshot.value.objectForKey("username")as!String
        print("Username: \(currentUser)")
            self.currentUsername = currentUser
            },withCancelBlock: { error in print(error.description)}
        )
    }
    
        
        
        

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTravel(sender: AnyObject) {
        let travelText = travelarticleFied.text
        if travelText != ""{
            // Build the new Travel.
            // AnyObject is needed because of the votes of type Int.
            let newTravel: Dictionary<String, AnyObject > = [
            "travelText": travelText!,
            
            "Votes": 0,
            "author": currentUsername
                
            
            ]
            // Send it over to DataService to seal the deal.
            DataService.dataService.createNewTravel(newTravel)
            if let navController = self.navigationController{navController.popViewControllerAnimated(true)
        }
       
    
    }
        let locationText = locationField.text
        if locationText != ""{
            let newLocation: Dictionary<String, AnyObject> = [
            "locationText": locationText!
                ]
            // Send it over to DataService to seal the deal.
            DataService.dataService.createNewLocation(newLocation)
            if let navController = self.navigationController{navController.popViewControllerAnimated(true)
            }
            
        }
    }


       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
