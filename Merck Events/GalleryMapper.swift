//
//  GalleryMapper.swift
//  Merck Events
//
//  Created by mac on 3/19/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class GalleryMapper: NSObject {
    func mapFromJson(jsonObj:NSDictionary) -> Gallery
    {
        let tempGallery = Gallery();
        if let imgPath = jsonObj["ImagePath"] as? String
        {
            tempGallery.imagePath = imgPath;
        }
        if let id = jsonObj["Id"] as? Int
        {
            tempGallery.id = id;
        }
        return tempGallery;
    }
}
