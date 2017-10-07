//
//  EventCell.swift
//  Merck Events
//
//  Created by mac on 2/27/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBAction func onBtnLocationClicked(_ sender: Any) {
        let btn = sender as! UIButton;
        let vc = TransitionsHelper().getViewController(name: "mapView") as! LocationViewController;
        vc.mapCoords = self.mapCoords;
        print(btnLocation.tag)
        print(DataSingleton.sharedInstance.userEvents.count);
        DataSingleton.sharedInstance.currentEvent = DataSingleton.sharedInstance.userEvents[0];
        currentView.navigationController?.pushViewController(vc, animated: true);
    }
    @IBOutlet weak var btnLocation: UIButton!
    @IBOutlet weak var lblEventLocation: UILabel!
    @IBOutlet weak var lblEventTitle: UILabel!
    @IBOutlet weak var lblEventDate: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    var currentView:UIViewController!;
    var mapCoords:MapCoords = MapCoords();
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
