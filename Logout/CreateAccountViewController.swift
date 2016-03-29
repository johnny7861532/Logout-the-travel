//
//  CreateAccountViewController.swift
//  Firebase ready
//
//  Created by Johnny' mac on 2016/3/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    
    
    
    
    
    @IBAction func creatAccount(sender: AnyObject){
    let username = usernameField.text
    let email = emailField.text
    let password = passwordField.text
        
        if username != "" && email != "" && password != "" {
            // 申請帳號
            DataService.dataService.BASE_REF.createUser(email, password: password, withValueCompletionBlock:{ error, result in
                if error != nil{
                self.signupErrorAlert("Opps!", message:"Check your Username or Password.")
                
                }else
                {
                    DataService.dataService.BASE_REF.authUser(email, password: password, withCompletionBlock:{ error, authData in
                
                let user = ["provider":authData.provider!, "email":email!, "username":username!]
                    DataService.dataService.createNewAccount(authData.uid, user:user)})
                //確定儲存正確的uid
                    NSUserDefaults.standardUserDefaults().setValue( result["uid"], forKey: "uid")
                //進入app
                    self.performSegueWithIdentifier("NewUserLoggedIn", sender: nil)
                    
                }
            
            })
            
        
        }else
        {
            signupErrorAlert("Opps!", message:"Don't forget your your username, email and password!")

}
}
    func signupErrorAlert(titel:String, message:String){
       // Called upon signup error to let the user know signup didn't work.
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)

}
    @IBAction func cancelCreateAccount(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
}

