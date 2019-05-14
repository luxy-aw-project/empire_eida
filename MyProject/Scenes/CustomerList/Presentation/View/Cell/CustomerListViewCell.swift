//
//  CustomerListViewCell.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
import UIKit

class CustomerListViewCell: UITableViewCell {
    @IBOutlet weak var customerIcon: UIImageView!
    @IBOutlet weak var customerName: UILabel!

    func updateCell(_ model: CustomerListCellModel) {
        self.customerIcon.image = UIImage(named: model.icon)
        self.customerName.text = model.customerName
    }
}
