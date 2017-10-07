//
//  ChatCell.swift
//  Merck Events
//
//  Created by mac on 3/14/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    @IBOutlet weak var rightMargin: NSLayoutConstraint!

    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var imgUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
