//
//  SpeakerMapper.swift
//  Merck Events
//
//  Created by mac on 3/7/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import CoreData

class SpeakerMapper: NSObject {
    //
    //  AttendeeMapper.swift
    //  Merck Events
    //
    //  Created by mac on 3/7/17.
    //  Copyright © 2017 Sict. All rights reserved.
    //
    
    //
    //  UserMapper.swift
    //  Merck Events
    //
    //  Created by mac on 2/27/17.
    //  Copyright © 2017 Sict. All rights reserved.
    //
        
        
        func map(managedObject:NSManagedObject) -> Speaker
        {
            var mappedUser = Speaker();
            
            if let fname = managedObject.value(forKey: "firstName") as? String
            {
                mappedUser.firstName = fname;
            }
            if let lname = managedObject.value(forKey: "lastName") as? String
            {
                mappedUser.lastName = lname;
            }
            if let country = managedObject.value(forKey: "country") as? String
            {
                mappedUser.country = country;
            }
            if let hospital = managedObject.value(forKey: "hospital") as? String
            {
                mappedUser.hospital = hospital;
            }
            if let id = managedObject.value(forKey: "id") as? Int
            {
                mappedUser.id = id
            }
            if let imagePath = managedObject.value(forKey: "imagePath") as? String
            {
                mappedUser.imagePath = imagePath
            }
            if let isManager = managedObject.value(forKey: "isManager") as? Bool
            {
                mappedUser.isManager = isManager;
            }
            
            
            return mappedUser;
        }
    }


