//
//  ChatMapper.swift
//  Merck Events
//
//  Created by mac on 3/15/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class ChatMapper: NSObject {
    func mapToJson(chatObj:Chat) -> [String:Any]
    {
        var jsonData:[String:Any]=[:];
        jsonData["comment"]=chatObj.content;
        jsonData["CreatorId"]=chatObj.senderId;
        jsonData["CommentType"]=chatObj.type;
        jsonData["EventId"]=chatObj.eventId;
        jsonData["Creatorfname"] = chatObj.senderName;
        jsonData["CreatorImage"] = chatObj.senderImage;

        
        return jsonData;
    }
}
