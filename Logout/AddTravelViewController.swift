//
//  AddTravelViewController.swift
//  Logout
//
//  Created by Johnny' mac on 2016/3/29.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit
import Firebase

class AddTravelViewController: UIViewController {
    var currentUsername = ""
    var newLocation = ""
       
    @IBOutlet weak var travelarticleFied: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get username of the current user, and set it to currentUsername, so we can add it to the Travel.\
        DataService.dataService.CURRENT_USER_REF.observeEventType(FEventType.Value, withBlock: { snapshot in
            let currentUser = snapshot.value.objectForKey("username")as! String
            
            print("Username: \(currentUser)")
            
            self.currentUsername = currentUser
            },withCancelBlock: { error in print(error.description)}
        )}
    
        
   
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTravel(sender: AnyObject) {
        let travelText = travelarticleFied.text
        if travelText != ""{
            // Build the new Travel.
            // AnyObject is needed because of the likes of type Int.
            let newTravel: Dictionary<String, AnyObject > = [
                "travelText": travelText!,
                
                "Likes": 0,
                "author": currentUsername
                
                
            ]
            // Send it over to DataService to seal the deal.
            DataService.dataService.createNewTravel(newTravel)
            if let navController = self.navigationController{navController.popViewControllerAnimated(true)
            }
            
            
        }
                }
    @IBAction func Logout(sender: AnyObject) {
        // unauth() is the logout method for the current user.
        DataService.dataService.CURRENT_USER_REF.unauth()
        // Remove the user's uid from storage.
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        // Head back to Login!
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("Login")
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
        
    }
    
    
    
    
}
