//
//  SpeakersController.swift
//  Merck Events
//
//  Created by mac on 3/7/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class SpeakersController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "speakerCell") as! SpeakerCell;
        let tempSpeaker = DataSingleton.sharedInstance.currentEvent.getSpeakers()[indexPath.section];
        print(tempSpeaker.imagePath);
        if(tempSpeaker.imagePath != "")
        {
            cell.imgSpeaker.sd_setImage(with: URL(string:tempSpeaker.imagePath) , completed: nil);
        }
        else
        {
            cell.imgSpeaker.image = UIImage(named: "avatar");
        }
        cell.lblSpeakerName.text = tempSpeaker.firstName + " "+tempSpeaker.lastName;
        
        let selectedView = UIView();
        selectedView.backgroundColor = UIColor.clear;
        cell.selectedBackgroundView = selectedView;
        
        
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataSingleton.sharedInstance.currentEvent.getSpeakers().count;
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
        vc.currentProfile = DataSingleton.sharedInstance.currentEvent.getSpeakers()[indexPath.section];
        self.navigationController?.pushViewController(vc, animated: true);
    }

}
