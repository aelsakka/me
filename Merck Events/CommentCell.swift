//
//  CommentCell.swift
//  Merck Events
//
//  Created by mac on 3/20/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var tvComment: UITextView!
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
