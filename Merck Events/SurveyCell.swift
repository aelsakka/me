//
//  SurveyCell.swift
//  Merck Events
//
//  Created by mac on 3/16/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class SurveyCell: UITableViewCell {

    @IBOutlet weak var lblCreatorName: UILabel!
    @IBOutlet weak var lblSurveyName: UILabel!
    @IBOutlet weak var imgSurvey: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
