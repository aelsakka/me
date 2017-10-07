//
//  SurveyStore.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import Alamofire

class SurveyStore: NSObject {

    func get(eventId:Int,userId:Int,callback:@escaping ([Survey])->Void)
    {
        print(Constants.baseUrl + "surveys?EventId=" +  String(eventId) + "&UserId=" + String(userId));
        Alamofire.request(Constants.baseUrl + "surveys?EventId=" +  String(eventId) + "&UserId=" + String(userId)).responseJSON(completionHandler: {
            response in
            
            switch(response.result)
            {
            case .success:
                let data = response.result.value as! NSDictionary;
                var surveys = [Survey]();
                if let surveysData = data["Surveys"] as? [NSDictionary]
                {
                    for surveyObj in surveysData
                    {
                        let tempSurvey = SurveysMapper().mapFromJson(jsonData: surveyObj);
                        if let questionsObject = surveyObj["Questiions"] as? [NSDictionary]
                        {
                            for questionObj in questionsObject
                            {
                                let tempQuestion = QuestionMapper().mapFromJson(jsonData: questionObj);
                                    tempQuestion.answers=[];
                                
                                
                                let tempQuestionResult = QuestionResultMapper().mapFromJson(jsonObj: questionObj);
                                tempQuestion.questionResult = tempQuestionResult;
                               
                                if let answersObject = questionObj["Answers"] as? [NSDictionary]
                                {
                                    tempQuestion.answers=[Answer]();
                                    for answerObj in answersObject
                                    {
                                        let tempAnswer = AnswerMapper().mapFromJson(jsonData: answerObj);
                                        tempQuestion.answers.append(tempAnswer);
                                    }
                                  
                                }
                                 tempSurvey.questions.append(tempQuestion);
                                
                            }
                        }
                        surveys.append(tempSurvey);
                    }
                }
                
                callback(surveys);
                break;
            case .failure:
                callback([Survey]());
                break;
            }
            
        })
    }
    
    func post(survey:Survey,callback:@escaping (Bool)->Void)
    {
        var resultsArray :[Any]=[];
        
        for question in survey.questions
        {
            let tempQJson = QuestionResultMapper().mapToJson(qrObject: question.questionResult);
            resultsArray.append(tempQJson);
        }
        var resultsJson:[String:Any] = ["Res":resultsArray];
        Alamofire.request(Constants.baseUrl+"SurveyAns",method:.post,parameters:resultsJson,encoding: JSONEncoding.default).responseJSON(completionHandler: {
            response in
            
            switch(response.result)
            {
                
            case .success:
                
                 print("Response JSON: \(resultsJson)")
                callback(true);
                break;
                
            case .failure:
                callback(false);
                break;
            }
            
            
        })
        
    }
}
