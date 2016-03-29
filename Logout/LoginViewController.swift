//
//  LoginViewController.swift
//  Firebase ready
//
//  Created by Johnny' mac on 2016/3/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func tryLogin(sender: AnyObject) {
        let email = emailField.text
        let password = passwordField.text
        
        if email != "" && password != ""{
            // Friebase授權使用者登入
            DataService.dataService.USER_REF.authUser(email, password: password, withCompletionBlock:{error, authData in
                if error != nil{
                    print(error)
                    self.loginErrorAlert("Opps!", message: "Check your username and password!")}
                    
                else{
                    // 確定是正確的UID存入
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    //進入app
                    self.performSegueWithIdentifier("CurrentlyLoggedIn", sender: nil)
                }
                
            })
        }else{
            //如果發生問題
            loginErrorAlert("Opps!", message: "Don't forget to enter your username and password!")
        }
    }
    func loginErrorAlert(title: String, message: String){
        //當出現錯誤時callout
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
    }
    }

