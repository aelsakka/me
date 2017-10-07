//
//  EventStore.swift
//  Merck Events
//
//  Created by mac on 2/27/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class EventStore: NSObject {
    func get(eventsData:[NSDictionary],callback:([Event])->Void)
    {
        var events = [Event]();
        
        for event in eventsData
        {
            var tempEvent = Event();
            if let title = event["Title"] as? String
            {
                tempEvent.title = title;
            }
            if let details = event["details"] as? [NSDictionary]
            {
                if let mapLink =  details[0]["webmaplink"] as? String
                {
                    tempEvent.mapLink = mapLink;
                }
                if let date =  details[0]["DisplayDate"] as? String
                {
                    tempEvent.date = date;
                }
                if let desc =  details[0]["desc"] as? String
                {
                    tempEvent.details = desc;
                }
                if let long = details[0]["mapx"] as? NSNumber
                {
                    tempEvent.longitude = long;
                }
                if let lat = details[0]["mapy"] as? NSNumber
                {
                    tempEvent.latitude = lat;
                }
        
            }
            if let id = event["ID"] as? Int
            {
                tempEvent.id = id;
            }
            if let imgUrl = event["oneThirdimage"] as? String
            {
                tempEvent.halfImage = imgUrl;
            }
            if let isAttending = event["isattend"] as? Bool
            {
                tempEvent.isAttending = isAttending;
            }
            if let chatEnabled = event["chatenable"] as? Bool
            {
                tempEvent.chatEnabled = chatEnabled;
            }
            if let location = event["location"] as? String
            {
                tempEvent.location = location;
            }
        
            if let attendees = event["Attendees"] as? NSArray
            {
                var tempAttendees = [Attendee]();
                var tempAttendee = Attendee();
                
                for attendee in attendees {
                    let attendeeObj = attendee as! NSDictionary;
                    tempAttendee = Attendee();
                    if let fName = attendeeObj["FirstName"] as? String
                    {
                       tempAttendee.firstName = fName;
                    }
                    if let lName = attendeeObj["LastName"] as? String
                    {
                        tempAttendee.lastName = lName;
                    }
                    if let img = attendeeObj["Pic"] as? String
                    {
                        tempAttendee.imagePath = img;
                    }
                    
                    if let hospital = attendeeObj["Hospital"] as? String
                    {
                        tempAttendee.hospital = hospital;
                    }
                    
                    if let speciality = attendeeObj["Speciality"] as? String
                    {
                        tempAttendee.speciality =  speciality;
                    }
                    
                    if let country = attendeeObj["Country"] as? String
                    {
                        tempAttendee.country = country;
                    }
                   
                    tempAttendee.eventId = tempEvent.id;
                   if( DBHelper().saveEntity(entityName: "Attendee", entityObject: tempAttendee))
                    {
                        print("Attendees saved to db");
                    }
                    else
                   {
                     print("Failed to save attendees to db");
                    }
                    tempAttendees.append(tempAttendee);
                }
                tempEvent.setAttendees(attendees: tempAttendees);
                
            }
            if let speakers = event["Speakers"] as? NSArray
            {
                var tempSpeakers = [Speaker]();
                var tempSpeaker = Speaker();
                
                for speaker in speakers {
                    let speakerObj = speaker as! NSDictionary;
                    tempSpeaker = Speaker();
                    if let fName = speakerObj["FirstName"] as? String
                    {
                        tempSpeaker.firstName = fName;
                    }
                    if let lName = speakerObj["LastName"] as? String
                    {
                        tempSpeaker.lastName = lName;
                    }
                    if let img = speakerObj["Pic"] as? String
                    {
                        tempSpeaker.imagePath = img;
                    }
                    
                    if let hospital = speakerObj["Hospital"] as? String
                    {
                        tempSpeaker.hospital = hospital;
                    }
                    
                    if let speciality = speakerObj["Speciality"] as? String
                    {
                        tempSpeaker.speciality =  speciality;
                    }
                    
                    if let country = speakerObj["Country"] as? String
                    {
                        tempSpeaker.country = country;
                    }
                    
                    tempSpeaker.eventId = tempEvent.id;
                    if( DBHelper().saveEntity(entityName: "Speaker", entityObject: tempSpeaker))
                    {
                        print("Speakers saved to db");
                    }
                    else
                    {
                        print("Failed to save speakers to db");
                    }
                    tempSpeakers.append(tempSpeaker);
                }
                tempEvent.setSpeakers(speakers: tempSpeakers);
                
                if let agendas = event["agenda"] as? NSArray
                {
                    var tempAgendas = [Agenda]();
                    var tempAgenda = Agenda();
                    var lastDate="";
                    for agenda in agendas
                    {
                        let agendaObj = agenda as! NSDictionary;
                        tempAgenda = AgendaMapper().mapFromJson(jsonObj: agendaObj);
                        tempAgenda.eventId = tempEvent.id;
                        if(tempAgenda.date == lastDate)
                        {
                            tempAgenda.date = "";
                        }
                        else
                        {
                            lastDate = tempAgenda.date;
                        }
                        DBHelper().saveEntity(entityName: "Agenda", entityObject: tempAgenda);
                        tempAgendas.append(tempAgenda);
                    }
                    tempEvent.setAgenda(agenda: tempAgendas);
                }
              
                
            }
            AttachmentStore().get(eventId: tempEvent.id, callback: {
            attachments in
                tempEvent.setAttachments(attachments: attachments)
            })
       

            events.append(tempEvent);
            
            if DBHelper().saveEntity(entityName: "Event", entityObject:tempEvent)
            {
                print("Saved events to db");
            }
            else
            {
                print("Failed to save events to db");
            }
        }
        callback(events);
        
    }
    func getLocal(callback:(Bool)->Void)
    {
        let localEvents = DBHelper().loadEntity(entityName: "Event");
        if localEvents.count > 0
        {
            for localEvent in localEvents
            {
                var rEvent = EventMapper().map(managedObject: localEvent);
                let attendeesObjects = DBHelper().loadWithPredicate(entityName: "Attendee", format: "eventId == %@", args: [rEvent.id]);
                var attendees = [Attendee]();
                
                for attendeeObject in attendeesObjects
                {
                    let mappedAttendee = AttendeeMapper().map(managedObject: attendeeObject);
                    attendees.append(mappedAttendee);
                    
                }
                
                let speakersObjects = DBHelper().loadWithPredicate(entityName: "Speaker", format: "eventId == %@", args: [rEvent.id]);
                var speakers = [Speaker]();
                
                print("Speakers count : \(speakersObjects[0].value(forKey: "eventId"))");
                for speakerObject in speakersObjects
                {
                    let mappedSpeaker = SpeakerMapper().map(managedObject: speakerObject);
                    speakers.append(mappedSpeaker);
                }
                let agendaObjects = DBHelper().loadWithPredicate(entityName: "Agenda", format: "eventId == %@", args: [rEvent.id]);
                var agendas = [Agenda]();
                
    
                for agendaObject in agendaObjects
                {
                    let mappedAgenda = AgendaMapper().mapFromDB(managedObject: agendaObject);
                    agendas.append(mappedAgenda);
                }
                
                
                
                
                
                rEvent.setAttendees(attendees: attendees);
                rEvent.setSpeakers(speakers: speakers);
                rEvent.setAgenda(agenda: agendas);
                
                AttachmentStore().getLocal(eventId: rEvent.id, callback: {
                attachments in
                    rEvent.setAttachments(attachments: attachments);
                })
                DataSingleton.sharedInstance.userEvents.append(rEvent);
                
            
            }
            callback(true);
  
        }
        else
        {
            callback(false);
        }
    }
    }

