//
//  ViewsHelper.swift
//  Merck Events
//
//  Created by mac on 2/28/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class ViewsHelper: NSObject {

    func roundedImage(imageView: inout UIImageView)
    {
        imageView.layer.cornerRadius = (imageView.image?.size.height)!/2;
        imageView.clipsToBounds = true;
    }
}
