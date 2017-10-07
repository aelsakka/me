//
//  AttachmentMapper.swift
//  Merck Events
//
//  Created by mac on 3/8/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import CoreData

class AttachmentMapper: NSObject {
    func map(managedObject:NSManagedObject) -> Attachment
    {
        var mappedAttachment = Attachment();
        
        if let fname = managedObject.value(forKey: "fileName") as? String
        {
            mappedAttachment.fileName=fname;
        }
        if let fType = managedObject.value(forKey: "fileType") as? String
        {
            mappedAttachment.fileType = fType;
        }
        if let fPath = managedObject.value(forKey: "filePath") as? String
        {
            mappedAttachment.filePath = fPath;
        }
        if let id = managedObject.value(forKey: "id") as? Int
        {
            mappedAttachment.id = id
        }
      
        
        return mappedAttachment;
    }

}
