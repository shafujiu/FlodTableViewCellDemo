//
//  SFJFlodCell.swift
//  FlodTableViewCellDemo
//
//  Created by Shafujiu on 2020/8/4.
//  Copyright © 2020 Shafujiu. All rights reserved.
//

import UIKit

class SFJFlodCell: UITableViewCell {

    @IBOutlet weak var contentHeightC: NSLayoutConstraint!
    
    // 折叠
    @IBAction func flodBtnAct(_ sender: Any) {
        contentHeightC.constant = 50
        guard let tableView = self.superview as? UITableView else {
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    // 展开
    @IBAction func unflodBtnAct(_ sender: Any) {
        contentHeightC.constant = 109
        guard let tableView = self.superview as? UITableView else {
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}
