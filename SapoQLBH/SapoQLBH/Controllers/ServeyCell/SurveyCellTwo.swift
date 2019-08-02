//
//  SurveyCellTwo.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/1/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class SurveyCellTwo: UITableViewCell {

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var viewFour: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCornerRadiusView()
    }
    
    func setupCornerRadiusView() {
        viewOne.layer.cornerRadius = 4
        viewOne.clipsToBounds = true
        viewTwo.layer.cornerRadius = 4
        viewTwo.clipsToBounds = true
        viewThree.layer.cornerRadius = 4
        viewThree.clipsToBounds = true
        viewFour.layer.cornerRadius = 4
        viewFour.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
