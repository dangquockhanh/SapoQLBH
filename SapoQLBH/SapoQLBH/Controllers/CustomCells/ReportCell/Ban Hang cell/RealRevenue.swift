//
//  RealRevenue.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/5/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class RealRevenue: UITableViewCell {

    @IBOutlet weak var viewWhite: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewWhite.layer.cornerRadius = 5
        viewWhite.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
