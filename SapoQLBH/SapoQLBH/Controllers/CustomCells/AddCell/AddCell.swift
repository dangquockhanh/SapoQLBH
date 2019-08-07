//
//  AddCell.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/4/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class AddCell: UITableViewCell {

    @IBOutlet weak var addPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addPhotoImageView.layer.cornerRadius = addPhotoImageView.bounds.width / 2
        addPhotoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
