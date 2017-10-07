//
//  AttendeesController.swift
//  Merck Events
//
//  Created by mac on 3/6/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class AttendeesController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attendeeCell") as! AttendeeCell;
        let tempAttendee = DataSingleton.sharedInstance.currentEvent.getAttendees()[indexPath.section];
        print(tempAttendee.imagePath);
        if(tempAttendee.imagePath != "")
        {
            cell.imgAttendee.sd_setImage(with: URL(string:tempAttendee.imagePath) , completed: nil);
        }
        else
        {
            cell.imgAttendee.image = UIImage(named: "avatar");
        }
        cell.lblAttendeeName.text = tempAttendee.firstName;
        
        let selectedView = UIView();
        selectedView.backgroundColor = UIColor.clear;
        cell.selectedBackgroundView = selectedView;

        
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataSingleton.sharedInstance.currentEvent.getAttendees().count;
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
        let vc = TransitionsHelper().getViewController(name: "profileView") as! ProfileController;
        vc.currentProfile = DataSingleton.sharedInstance.currentEvent.getAttendees()[indexPath.section];
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
