//
//  AnswerMapper.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class AnswerMapper: NSObject {
    func mapFromJson(jsonData:NSDictionary)->Answer
    {
        var tempAnswer = Answer();
        
        if let id = jsonData["ID"] as? Int
        {
            tempAnswer.id = id;
        }
        if let content = jsonData["Answer"] as? String
        {
            tempAnswer.content = content;
        }
        if let avg = jsonData["Avg"] as? String
        {
            tempAnswer.average = avg;
        }
        
        return tempAnswer;
    }
}
