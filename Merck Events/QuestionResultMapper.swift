//
//  QuestionResultMapper.swift
//  Merck Events
//
//  Created by mac on 3/22/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class QuestionResultMapper: NSObject {
    func mapFromJson(jsonObj:NSDictionary)->QuestionResult
    {
        var tempQuestionResult = QuestionResult();
        tempQuestionResult.userId = DataSingleton.sharedInstance.currentUser.id;
        if let qId =  jsonObj["Id"] as? Int
        {
            tempQuestionResult.questionId = qId;
            
        }
        if let rObj = jsonObj["QuestionResult"] as? NSArray
        {
            if(rObj.count > 0)
            {
                if let qrObj = rObj[0] as? NSDictionary
                {
                    if let answerId = qrObj["AnswerID"] as? Int
                    {
                        tempQuestionResult.answerId = answerId;
                    }
                    if let resValue = qrObj["ResValue"] as? String
                    {
                        tempQuestionResult.resValue = resValue;
                    }
                }
            }
          
           
        }
     
        return tempQuestionResult;
    }
    
    func mapToJson(qrObject:QuestionResult)->NSDictionary
    {
        let tempJson:NSMutableDictionary=["ResValue":qrObject.resValue,"AnswerID":qrObject.answerId,"UserId":qrObject.userId,"QuestionID":qrObject.questionId];
        return tempJson;

    }
}
