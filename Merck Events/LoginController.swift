//
//  ViewController.swift
//  Merck Events
//
//  Created by mac on 2/23/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import JHSpinner

class LoginController: UIViewController {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    
    
    @IBAction func onLoginClicked(_ sender: Any) {
        let username = StringHelper.trimString(string: tfUserName.text);
        let password = StringHelper.trimString(string: tfPassword.text);
        if( username != "" && password != "")
        {
            let spinner = JHSpinnerView.showOnView(self.view, spinnerColor:UIColor.red, overlay:.fullScreen, overlayColor:UIColor.black.withAlphaComponent(0.6))
            
            self.view.addSubview(spinner)
         UserStore().get(username: username, password: password)
            {
                result in
                
                spinner.dismiss();
                
                if(result)
                {
                    let eventsViewCtrl = TransitionsHelper().getViewController(name: "sideMenuHandlerView");
                    self.present(eventsViewCtrl, animated: true, completion: nil);
                }
                else
                {
                    print("failed");
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view,

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

