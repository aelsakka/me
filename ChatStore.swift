//
//  ChatStore.swift
//  Merck Events
//
//  Created by mac on 3/14/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import Alamofire

class ChatStore: NSObject {
    static let sharedInstance = ChatStore();
    func getChat(eventId:Int,callback:@escaping ([Any])->Void)
    {
       
        Alamofire.request(Constants.baseUrl+"ioschat?EventId="+String(eventId)).responseJSON(completionHandler: {
            response in
            switch(response.result)
            {
            case .success:
                let data=response.result.value as! NSDictionary;
                let chatArray = data["Chats"] as? NSArray;
                var tempChat = Chat();
                var conversations = [Chat]();
                for chatObj in chatArray!
                {
                    let jsonObj=chatObj as! NSDictionary;
                    if((jsonObj["CommentType"] as? String) == "Chat")
                    {
                    tempChat = Chat();
                        tempChat.type = "Chat";
                    if let senderName = jsonObj["Creatorfname"] as? String
                    {
                        tempChat.senderName = senderName;
                    }
                    if let content = jsonObj["comment"] as? String
                    {
                        tempChat.content = content;
                    }
                    if let date = jsonObj["Date"] as? String
                    {
                        tempChat.date = date;
                    }
                    if let id = jsonObj["ID"] as? Int
                    {
                        tempChat.id = id;
                    }
                    if let senderId = jsonObj["CreatorId"] as? Int
                    {
                        tempChat.senderId = senderId;
                    }
                    if let senderImage = jsonObj["CreatorImage"] as? String
                    {
                        tempChat.senderImage = senderImage;
                    }
                  
                      conversations.append(tempChat);
                    }
                    
                }
                callback(ArraysHelper().split(array: conversations, splitSize: 10));
                break;
            case .failure:
                callback([]);
                break;
            }
            
        })
        
    }
    func getAnnouncement(eventId:Int,callback:@escaping ([Any])->Void)
    {
        
        Alamofire.request(Constants.baseUrl+"ioschat?EventId="+String(eventId)).responseJSON(completionHandler: {
            response in
            switch(response.result)
            {
            case .success:
                let data=response.result.value as! NSDictionary;
                let chatArray = data["Chats"] as? NSArray;
                var tempChat = Chat();
                var conversations = [Chat]();
                for chatObj in chatArray!
                {
                    let jsonObj=chatObj as! NSDictionary;
                    if((jsonObj["CommentType"] as? String) == "Announcement")
                    {
                        tempChat = Chat();
                        tempChat.type = "Announcement";
                        if let senderName = jsonObj["Creatorfname"] as? String
                        {
                            tempChat.senderName = senderName;
                        }
                        if let content = jsonObj["comment"] as? String
                        {
                            tempChat.content = content;
                        }
                        if let date = jsonObj["Date"] as? String
                        {
                            tempChat.date = date;
                        }
                        if let id = jsonObj["ID"] as? Int
                        {
                            tempChat.id = id;
                        }
                        if let senderId = jsonObj["CreatorId"] as? Int
                        {
                            tempChat.senderId = senderId;
                        }
                        if let senderImage = jsonObj["CreatorImage"] as? String
                        {
                            tempChat.senderImage = senderImage;
                        }
                        
                        conversations.append(tempChat);
                    }
                    
                }
                callback(ArraysHelper().split(array: conversations, splitSize: 10));
                break;
            case .failure:
                callback([]);
                break;
            }
            
        })
        
    }
    func sendChat(chatObj:Chat,callback:@escaping (_ status:Bool)->Void)
    {
        let chatJson = ChatMapper().mapToJson(chatObj: chatObj);
        Alamofire.request(Constants.baseUrl+"ioschat",method:.post,parameters:chatJson).responseJSON(completionHandler: {
                response in
            
            switch(response.result)
            {
            case .success:
                callback(true);
            break;
            
            case .failure:
                callback(false);
            break;
            }
            
            
        })
        
    }
}
