  //
//  EventMapper.swift
//  Merck Events
//
//  Created by mac on 2/27/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import CoreData

class EventMapper: NSObject {
    func map(managedObject:NSManagedObject) -> Event
    {
        var mappedEvent = Event();
        
        if let chatEnabled = managedObject.value(forKey: "chatEnabled") as? Bool
        {
            mappedEvent.chatEnabled = chatEnabled;
        }
        if let date = managedObject.value(forKey: "date") as? String
        {
            mappedEvent.date = date
        }
        if let details = managedObject.value(forKey: "details") as? String
        {
            mappedEvent.details = details
        }
        if let halfImage = managedObject.value(forKey: "halfImage") as? String
        {
            mappedEvent.halfImage = halfImage;
        }
        if let id = managedObject.value(forKey: "id") as? Int
        {
            mappedEvent.id = id;
        }
        if let title = managedObject.value(forKey: "title") as? String
        {
            mappedEvent.title=title;
        }
        if let location = managedObject.value(forKey: "location") as? String
        {
            mappedEvent.location = location
        }
        if let long = managedObject.value(forKey: "longitude") as? NSNumber
        {
            mappedEvent.longitude = long;
        }
        if let lat = managedObject.value(forKey: "latitude") as? NSNumber
        {
            mappedEvent.latitude   = lat;
        }
        
        if let mapLink = managedObject.value(forKey: "mapLink") as? String
        {
            mappedEvent.mapLink = mapLink;
        }
        
        
        
//        if let attendees = managedObject.value(forKey: "Attendees") as? NSArray
//        {
//            var tempAttendees = [Attendee]();
//            var tempAttendee = Attendee();
//            
//            for attendee in attendees {
//                let attendeeObj = attendee as! NSDictionary;
//                tempAttendee.firstName = attendeeObj["FirstName"] as? String;
//                tempAttendee.imagePath = attendeeObj["Pic"] as? String
//                tempAttendee.hospital = attendeeObj["Hospital"] as? String
//                tempAttendee.speciality = attendeeObj["Speciality"] as? String
//                tempAttendee.
//            }
//            
//        }
        
        return mappedEvent;
    }

}
