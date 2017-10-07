//
//  SplashController.swift
//  Merck Events
//
//  Created by mac on 2/23/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewDidAppear(_ animated: Bool) {
        UserStore().getLocal
            {
                foundUser in
                if foundUser
                {
                    let vc = TransitionsHelper().getViewController(name: "sideMenuHandlerView");
                    self.present(vc, animated: true, completion: nil);
                }
                else
                {
                    let vc = TransitionsHelper().getViewController(name: "loginView");
                    self.present(vc, animated: true, completion: nil);
                }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
