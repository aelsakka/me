//
//  ArraysHelper.swift
//  Merck Events
//
//  Created by mac on 3/14/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class ArraysHelper: NSObject {
    
    func split(array:[Chat],splitSize:Int)->[Any]
    {
        let chunks = stride(from: 0, to: array.count, by: splitSize).map {
            Array(array[$0..<min($0 + splitSize, array.count)])
        }
        return chunks;
    }
}
