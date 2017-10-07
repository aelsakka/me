//
//  TableViewExtension.swift
//  Merck Events
//
//  Created by mac on 3/23/17.
//  Copyright © 2017 Sict. All rights reserved.
//

import UIKit

class TableViewExtension: NSObject {

}
extension UITableView {
    
    func tableViewScrollToBottom(animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            if numberOfRows > 0 {
                let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                self.scrollToRow(at: indexPath, at: UITableViewScrollPosition.bottom, animated: animated)
            }
        }
    }
}
