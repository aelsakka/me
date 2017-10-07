//
//  SurveysMapper.swift
//  Merck Events
//
//  Created by mac on 3/15/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class SurveysMapper: NSObject {
    func mapFromJson(jsonData:NSDictionary)->Survey
    {
        var tempSurvey = Survey();
        if let title = jsonData["Title"] as? String
        {
            tempSurvey.title = title;
        }
        if let id = jsonData["ID"] as? Int
        {
            tempSurvey.id = id;
        }
        if let cName = jsonData["CreatorName"] as? String
        {
            tempSurvey.creatorName = cName;
        }
        return tempSurvey;
    }
    func copy(survey:Survey) ->Survey
    {
        let tempSurvey = Survey();
        tempSurvey.creatorName = survey.creatorName;
        tempSurvey.id = survey.id;
        tempSurvey.isAnswered = survey.isAnswered;
        tempSurvey.questions = survey.questions;
        tempSurvey.title = survey.title;
        return tempSurvey;
    }
}
