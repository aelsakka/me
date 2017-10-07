//
//  GalleryStore.swift
//  Merck Events
//
//  Created by mac on 3/19/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import Alamofire

class GalleryStore: NSObject {

    func get(eventId:Int,callback:@escaping (_ gallery:[Gallery])->Void)
    {
        Alamofire.request(Constants.baseUrl+"EventGallery?EventId=" + String(eventId)).responseJSON(completionHandler: {
            response in
             var gallery = [Gallery]();
            switch(response.result)
            {
            case .success:
                print(response.result.value);
               
                let jsonResponse = response.result.value as! NSDictionary;
                let galleryArray = jsonResponse["Gallery"] as! [NSDictionary];
                for galleryObj in galleryArray
                {
                    var tempGallery = Gallery();
                    tempGallery = GalleryMapper().mapFromJson(jsonObj: galleryObj);
                    gallery.append(tempGallery);
                }
                callback(gallery);
                break;
            case .failure:
                callback(gallery);
                break;
            }
        })
    }
}
