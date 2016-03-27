//
//  Travel.swift
//  Logout
//
//  Created by Johnny' mac on 2016/3/24.
//  Copyright © 2016年 Johnny' mac. All rights reserved.
//

import Foundation
import Firebase
class Travel {
    private var _travelRef: Firebase!
    private var _travelkey: String!
    private var _travelLocation: String!
    private var _travelText: String!
    private var _username: String!
    private var _travelLikes: Int!
    
    var travelkey:String{
    return _travelkey
    }
    var travelLocation:String{
    return _travelLocation
    }
    var travelText:String{
    return _travelText
    }
    var username:String{
    return _username
    }
    var travelLikes: Int{
    return _travelLikes
    }
// Initialize the new Travel
    
    init(key:String, dictionary:Dictionary<String, AnyObject> )
    {
    self._travelkey = key
    
// Within the Travel, or Key, the following properties are children
        if let travel = dictionary["travelText"]as? String
        {
        self._travelText = travel
        }
        if let likes = dictionary["travelLikes"]as? Int
        {
        self._travelLikes = likes
        }
        if let  location = dictionary["travelLocation"]as? String
        {
        self._travelLocation = location
        }
        if let user = dictionary["author"]as? String
        {
        self._username = user
        }else{
        self._username = ""
        }
        // The above properties are assigned to their key.
        self._travelRef = DataService.dataService.TRAVEL_REF.childByAppendingPath(self._travelkey)
        
    }


}
