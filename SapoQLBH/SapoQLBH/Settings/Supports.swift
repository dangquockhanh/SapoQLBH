//
//  Supports.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/7/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class Supports: NSObject {
    
    class func instantiateViewController(_ storyboardName: String, with identifier: String = "") -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier.isEmpty ? storyboardName : identifier)
    }
}
