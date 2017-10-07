//
//  QuestionMapper.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class QuestionMapper: NSObject {
    func mapFromJson(jsonData:NSDictionary)->Question
    {
        var tempQuestion = Question();
        
        if let id = jsonData["Id"] as? Int
        {
            tempQuestion.id = id;
        }
        if let content = jsonData["Question"] as? String
        {
            tempQuestion.content = content;
        }
        if let type = jsonData["QuestionType"] as? String
        {
            tempQuestion.type=type;
        }
        if let qAnswer = jsonData["QuestionResult"] as? NSDictionary
        {
            //tempQuestion.questionResult = qAnswer;
        }
        
        
        return tempQuestion;
    }
}
