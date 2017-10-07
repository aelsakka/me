//
//  StringHelper.swift
//  Merck Events
//
//  Created by mac on 2/26/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class StringHelper: NSObject {
    
    static func trimString(string:String?) -> String
    {
        let temp = string?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return temp!;
    }
    
    static func checkStringExists(object:Any?) -> String
    {
        if object is NSNull
        {
            return "";
        }
        else
        {
            return object  as! String;
        }
        
    }
//    func getThumb(image:String)->String
//    {
//        var l = image.lastIndex(of:"/");
//        
//        print(l);
//        print(image)
//        
//        if(l != nil)
//        {
//            return image.substring(to: image.index(image.startIndex,offsetBy:l!))+"min"+image.substring(from: image.index(l!,offsetBy:image.endIndex));
//        }
//        else
//        {
//            return "";
//        }
//    }
//
}
extension String {
    func index(of target: String) -> Int? {
        if let range = self.range(of: target) {
            return characters.distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
    
    func lastIndex(of target: String) -> Int? {
        if let range = self.range(of: target, options: .backwards) {
            return characters.distance(from: startIndex, to: range.lowerBound)
        } else {
            return nil
        }
    }
}
