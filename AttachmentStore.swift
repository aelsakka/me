//
//  AttachmentStore.swift
//  Merck Events
//
//  Created by mac on 3/8/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import Alamofire

class AttachmentStore: NSObject {

    //EventAttachments?EventId=
    func get(eventId:Int,callback:@escaping ([Attachment])->Void)
    {
        Alamofire.request(Constants.baseUrl+"EventAttachments?EventId="+String(eventId)).responseJSON {
            response in
            
            switch(response.result)
            {
            case .success:
                let attachmentsJson = response.result.value as?NSDictionary;
                let attachmentsData = attachmentsJson?["Attachments"] as? NSArray;
                var attachments = [Attachment]();
                 for attachment in attachmentsData!
                 {
                    var tempAttachment = Attachment();
                    var attachmentObj = attachment as? NSDictionary;
                    tempAttachment.fileName = StringHelper.checkStringExists(object: attachmentObj?["FileName"]);
                    tempAttachment.filePath = StringHelper.checkStringExists(object: attachmentObj?["FilePath"]);
                    tempAttachment.fileType = StringHelper.checkStringExists(object: attachmentObj?["FileType"]);
                    tempAttachment.eventId = eventId;
                    
                    
                    attachments.append(tempAttachment);
                  if(DBHelper().saveEntity(entityName: "Attachment", entityObject: tempAttachment))
                  {
                    print("Attachments Saved to DB");
                  }
                    else
                  {
                    print("Failed to save attachments to db");
                    }
                 
                 }
                callback(attachments);
                break;
                
            case .failure:
                callback([Attachment]());
                break;
            }
        }
        
       
    }
    func getLocal(eventId:Int,callback:([Attachment])->Void)
    {
        let localAttachments = DBHelper().loadWithPredicate(entityName: "Attachment", format: "eventId == %@", args: [eventId]);
        var attachmentsArray = [Attachment]();
        if localAttachments.count > 0
        {
            for localAttachment in localAttachments
            {
                let rAttachment = AttachmentMapper().map(managedObject: localAttachment);
                attachmentsArray.append(rAttachment);
                
                
            }

            callback(attachmentsArray);
            
        }
        else
        {
            callback([Attachment]());
        }
    }

    
    
    
}
