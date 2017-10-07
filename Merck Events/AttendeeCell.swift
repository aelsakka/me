//
//  AttendeeCell.swift
//  Merck Events
//
//  Created by mac on 3/6/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class AttendeeCell: UITableViewCell {

    @IBOutlet weak var lblAttendeeName: UILabel!
    @IBOutlet weak var imgAttendee: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
