//
//  DataSingleton.swift
//  Merck Events
//
//  Created by mac on 2/26/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class DataSingleton: NSObject {
    static let sharedInstance = DataSingleton();
    var currentUser:User!;
    var userEvents = [Event]();
    var currentEvent:Event!;
    

    
    

}
