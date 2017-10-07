//
//  Question.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class Question: NSObject {
    var id:Int = 0;
    var answers=[Answer]();
    var content:String="";
    var type:String="";
    var questionResult = QuestionResult();
    var surveyId:Int = 0 ;
}
