//
//  EventsController.swift
//  Merck Events
//
//  Created by mac on 2/23/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit
import SDWebImage
import AKSideMenu

class EventsController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBAction func onSideMenuBtnClicked(_ sender: Any) {
        self.sideMenuViewController?.presentLeftMenuViewController();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell;
        let tempEvent = DataSingleton.sharedInstance.userEvents[indexPath.section];
        cell.selectionStyle = UITableViewCellSelectionStyle.none;
        cell.eventImage.sd_setImage(with: URL(string:  tempEvent.halfImage));
        cell.lblEventDate.text = tempEvent.date;
        cell.lblEventTitle.text = tempEvent.title;
        cell.lblEventLocation.text = tempEvent.location;
        cell.currentView = self;
        
        for view in cell.subviews
        {
            if view is UIButton
            {
                view.tag = 5;
            }
        }
//        if let lon = tempEvent.longitude as? NSNumber
//        {
//            
//            cell.mapCoords.longitude = lon;
//        }
//        if let lat = tempEvent.latitude as? NSNumber
//        {
//            cell.mapCoords.latitude = lat;
//        }
    
        
        
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataSingleton.sharedInstance.userEvents.count;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0;
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))

            headerView.backgroundColor = UIColor.clear
       
        return headerView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataSingleton.sharedInstance.currentEvent = DataSingleton.sharedInstance.userEvents[indexPath.section];
        let vc = TransitionsHelper().getViewController(name: "eventView");
        self.navigationController?.pushViewController(vc, animated: true);
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
