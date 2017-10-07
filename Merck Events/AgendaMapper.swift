//
//  AgendaMapper.swift
//  Merck Events
//
//  Created by mac on 3/29/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import CoreData

class AgendaMapper: NSObject {
    func mapFromJson(jsonObj:NSDictionary) -> Agenda
    {
        var tempAgenda = Agenda();
        if let subject = jsonObj["Subject"] as? String
        {
            tempAgenda.subject = subject;
        }
        if let color = jsonObj["Color"] as? String
        {
            tempAgenda.color = color;
        }
        if let desc = jsonObj["desc"] as? String
        {
            tempAgenda.desc = desc;
        }
        if let to = jsonObj["To"] as? String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let date = dateFormatter.date(from: to)
            print(date);
            
            dateFormatter.dateFormat = "hh:mm"
            let newDate = dateFormatter.string(from: date!)
            tempAgenda.to = newDate;
        }
        if let from = jsonObj["From"] as? String
        {
            
   
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            let date = dateFormatter.date(from: from)
            print(date); 
            dateFormatter.dateFormat = "hh:mm"
            let newDate = dateFormatter.string(from: date!)
             tempAgenda.from = newDate;

            
//           tempAgenda.from = from;
        }
        if let date = jsonObj["datefrom"] as? String
        {
            tempAgenda.date = date;
        }
        if let id = jsonObj["ID"] as? Int
        {
            tempAgenda.id = id;
        }
        
        
        return tempAgenda;
    }
    func mapFromDB(managedObject:NSManagedObject) -> Agenda
    {
        var tempAgenda = Agenda();
        
        if let subject = managedObject.value(forKey: "subject") as? String
        {
            tempAgenda.subject = subject;
        }
        if let color = managedObject.value(forKey: "color") as? String
        {
            tempAgenda.color = color;
        }
        if let desc = managedObject.value(forKey: "desc") as? String
        {
            tempAgenda.desc = desc;
        }
        if let to = managedObject.value(forKey: "to") as? String
        {
            tempAgenda.to = to;
        }
        if let from = managedObject.value(forKey: "from") as? String
        {
            tempAgenda.from = from;
        }
        if let date = managedObject.value(forKey: "date") as? String
        {
            tempAgenda.date = date;
        }
        if let id = managedObject.value(forKey: "id") as? Int
        {
            tempAgenda.id = id;
        }
        if let eventId = managedObject.value(forKey: "eventId") as? Int
        {
            tempAgenda.eventId = eventId;
        }
        return tempAgenda;
    }
}
