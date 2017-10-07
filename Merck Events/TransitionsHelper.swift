//
//  TransitionsHelper.swift
//  Merck Events
//
//  Created by mac on 2/27/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class TransitionsHelper: NSObject {

    func getViewController(name:String) -> UIViewController
    {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: name) as UIViewController
        
        return vc;
    }
    
    func getViewWithNavCtrl(name:String) -> UINavigationController
    {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: name) as UIViewController
        let navController = UINavigationController(rootViewController: vc) // Creating a navigation controller with VC1 at the root of the navigation stack.
        return navController;
    }


 
}
