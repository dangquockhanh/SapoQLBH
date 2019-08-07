//
//  SurveyTableCell.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/1/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class SurveyTableCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var datePickerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 4
        viewCell.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
