//
//  Event.swift
//  Merck Events
//
//  Created by mac on 2/27/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class Event: NSObject {
    var title:String!;
    var halfImage:String!;
    var id:Int=0;
    var location:String!;
    var details:String!;
    var date:String!;
    private var attendees=[Attendee]();
    private var speakers=[Speaker]();
    private var attachments = [Attachment]();
    private var surveys = [Survey]();
    private var gallery = [Gallery]();
    private var agenda = [Agenda]();
    var mapLink:String="";
    var isAttending:Bool=false;
    var chatEnabled:Bool = true;
    var longitude:NSNumber = 41.2;
    var latitude:NSNumber = 41.2;
    
    
   func getAttachments() -> [Attachment]
   {
    return self.attachments;
    }
    func getSpeakers() -> [Speaker]
    {
        return self.speakers;
    }
    func getAttendees() -> [Attendee]
    {
        return self.attendees;
    }
    func getSurveys() -> [Survey]
    {
        return self.surveys;
    }
    func getGallery() -> [Gallery]
    {
        return self.gallery;
    }
    func getAgenda()-> [Agenda]
    {
        return self.agenda;
    }
    
    func setAttachments(attachments:[Attachment])
    {
       self.attachments = attachments;
    }
    func setSpeakers(speakers:[Speaker])
    {
       self.speakers = speakers;
    }
    func setAttendees(attendees:[Attendee])
    {
        self.attendees=attendees;
    }
    func setSurveys(surveys:[Survey])
    {
        self.surveys = surveys;
    }
    func setGallery(gallery:[Gallery])
    {
        self.gallery = gallery;
    }
    func setAgenda(agenda:[Agenda])
    {
        self.agenda = agenda;
    }
    
    
    
    
}
