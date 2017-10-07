//
//  UserStore.swift
//  Merck Events
//
//  Created by mac on 2/23/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import Alamofire

class UserStore: NSObject {

    func get(username:String,password:String,callback: @escaping (Bool)->Void)
    {
      
        let params:Parameters = [
        "username":username,
        "password":password
        ]
        var user = User();
    
        Alamofire.request(Constants.baseUrl+"Validatelogin?username="+username+"&password="+password+"&version=0.2.5&LastMod=2016-06-01T09:52:31.0842106Z").responseJSON {
            response in
      
            
            switch response.result {
            case .success:
                let data = response.result.value as! NSDictionary;
                if(data["Validation"] as? String == "true")
                {
                    //print(Constants.baseUrl+"Login?userName="+username+"&Password="+password+"version=0.2.5");
                    Alamofire.request(Constants.baseUrl+"Login?userName="+username+"&Password="+password+"&version=0.2.5").responseJSON
                    {
                        response in
                        
                        switch response.result
                        {
                        case .success :
                           let userData = response.result.value as! NSDictionary;
                            if let fname = userData["Firstname"] as? String
                            {
                                user.firstName = fname;
                            }
                           if let lname = userData["Lastname"] as? String
                           {
                            user.lastName = lname;
                           }
                            if let hospital = userData["Hospital"] as? String
                            {
                                user.hospital = hospital;
                            }
                           
                            
                            if let speciality = userData["Speciality"] as? String
                            {
                                user.speciality = speciality;
                            }
                            if let isManager = userData["usertype"] as? String
                            {
                                if (isManager == "Manager")
                                {
                                    user.isManager =  true;
                                }
                                else
                                {
                                    user.isManager = false;
                                }
                            }
                            if let image = userData["Image"] as? String
                            {
                                user.imagePath = image;
                            }
                            if let id = userData["ID"] as? Int
                            {
                                user.id = id;
                            }
                            
                            
                            
                            //Saving the user to the database
                             if (DBHelper().saveEntity(entityName: "User", entityObject: user))
                             {
                                print("Saved to database")
                             }
                            else
                             {
                                print("Failed to save to db");
                             }
                            
                            if let events = userData["assignedevents"] as? [NSDictionary]
                            {
                                EventStore().get(eventsData: events)
                                {
                                    events in
                                    DataSingleton.sharedInstance.userEvents = events;
                                    DataSingleton.sharedInstance.currentUser = user;
                                    callback(true);
                                };
                            }
                            else
                            {
                                // no assigned events
                            }
                            
                            
                            
                            break;
                        case .failure(let error) :
                            callback(false);
                            break;
                        }
                        
                    }
                }
                else
                {
                    callback(false)
                }
            case .failure(let error):
                print(error)
                callback(false)
            }
            
            print(response);
        }
        
        
        
    }
    
    func getLocal(callback:(Bool)->Void)
    {
        let localUser = DBHelper().loadEntity(entityName: "User");
        if localUser.count > 0
        {
            var rUser = UserMapper().map(managedObject: localUser[0]);
            DataSingleton.sharedInstance.currentUser = rUser;
            EventStore().getLocal(callback: {
            found in
                
                if found
                {
                   callback(true);
                }
                else
                {
                //Failed to load events from db
                    callback(false);
                }
            })
            
        }
        else
        {
            callback(false);
        }
    }
}
