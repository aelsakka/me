//
//  AgendaCell.swift
//  Merck Events
//
//  Created by mac on 4/18/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class AgendaCell: UITableViewCell {
    @IBOutlet weak var lblFrom: UILabel!

    @IBOutlet weak var lblMarginTop: NSLayoutConstraint!
    @IBOutlet weak var tvDesc: UITextView!
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var lblAgendaDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
