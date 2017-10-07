//
//  AttachmentCell.swift
//  Merck Events
//
//  Created by mac on 3/8/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class AttachmentCell: UITableViewCell {

    @IBOutlet weak var lblFile: UILabel!
    @IBOutlet weak var imgFile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
