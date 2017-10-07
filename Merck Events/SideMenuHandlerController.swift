//
//  SideMenuController.swift
//  Merck Events
//
//  Created by mac on 2/28/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import AKSideMenu

class SideMenuHandlerController: AKSideMenu,AKSideMenuDelegate  {

    override public func awakeFromNib() {
        self.contentViewController = TransitionsHelper().getViewWithNavCtrl(name: "eventsView");
        self.leftMenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "menuView")
        self.delegate=self;
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - <AKSideMenuDelegate>
    public func sideMenu(_ sideMenu: AKSideMenu, willShowMenuViewController menuViewController: UIViewController) {
        print("willShowMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, didShowMenuViewController menuViewController: UIViewController) {
        print("didShowMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, willHideMenuViewController menuViewController: UIViewController) {
        print("willHideMenuViewController")
    }
    
    public func sideMenu(_ sideMenu: AKSideMenu, didHideMenuViewController menuViewController: UIViewController) {
        print("didHideMenuViewController")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
