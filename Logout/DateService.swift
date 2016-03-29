//
//  DateService.swift
//  Firebase ready
//
//  Created by Johnny' mac on 2016/3/23.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import Foundation
import Firebase

class DataService{
 static let dataService = DataService()
    private var _BASE_REF = Firebase(url:"\(TRAVEL_URL)")
    private var _USER_REF = Firebase(url:"\(TRAVEL_URL)/users")
    private var _TRVEL_REF = Firebase(url:"\(TRAVEL_URL)/travels")
    
    var BASE_REF: Firebase {
    return _BASE_REF
    }
    
    var USER_REF: Firebase{
    return _USER_REF
    }
    
    
    
    var CURRENT_USER_REF: Firebase{
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid")as! String
        let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
        return currentUser!
    }
    
    var TRAVEL_REF: Firebase{
        return _TRVEL_REF
    }
    func createNewAccount(uid: String, user: Dictionary<String,String>){
    //創建新使用者
        USER_REF.childByAppendingPath(uid).setValue(user)
    }
    func createNewTravel(travel: Dictionary<String, AnyObject>){
    
        // Save the Travel
        // TRAVEL_REF is the parent of the new Trave: "travels".
        // childByAutoId() saves the travel and gives it its own ID.
        
        let firebaseNewTravel = TRAVEL_REF.childByAutoId()
        // setValue() saves to Firebase.
        firebaseNewTravel.setValue(travel)
        
    }
        }




