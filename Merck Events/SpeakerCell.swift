//
//  SpeakerCell.swift
//  Merck Events
//
//  Created by mac on 3/7/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class SpeakerCell: UITableViewCell {
    

    @IBOutlet weak var lblSpeakerName: UILabel!
    @IBOutlet weak var imgSpeaker: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
