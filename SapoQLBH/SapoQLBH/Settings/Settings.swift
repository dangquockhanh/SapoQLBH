//
//  Setting.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/1/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import Foundation

class IdentifierManager {
    // Survey Page
    static let surveyTableViewCellOne =  "SurveyTableCell"
    static let surveyTableViewCellTwo =  "SurveyCellTwo"
    static let surveyTableViewCellThree =  "SurveyCellThree"
    static let surveyTableViewCellFour =  "SurveyCellFour"
    static let surveyTableViewCellFive =  "SurveyCellFive"
    
    // Order Page
    static let orderCell = "OrderCell"
    static let orderCellOne = "OrderCellOne"
    static let orderCellTwo = "OrderCellTwo"
    static let orderCellSeparator = "OrderCellSeparator"
    
    // Product Page
    static let productCell = "ProductCell"
    static let productCellOne = "ProductCellOne"
   
    
    // Report Page
//    static let defaultCell = "DefaultCell"
    
    static let calendar = "Calendar"
    static let realRevenue = "RealRevenue"
    static let proceeds = "Proceeds"
    static let profits = "Profits"
    
    static let khoCell = "KhoCell"
    static let taiChinhCell = "TaiChinhCell"
    
    // Add Page
    static let addCell = "AddCell"
    static let addCellOne = "AddCellOne"
    static let addCellTwo = "AddCellTwo"
    static let addCellThree = "AddCellThree"

    // Storyboards
    static let survey = "Survey"
    static let order = "Order"
    static let product = "Product"
    static let report = "Report"
    static let add = "Add"
    
    // ViewControllers
    static let surveyViewController = "SurveyViewController"
    static let orderViewController = "OrderViewController"
    static let productViewController = "ProductViewController"
    static let reportViewController = "ReportViewController"
    static let addViewController = "AddViewController"
}

enum SectionType: Int {
    case one = 0
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case night
    case ten
}

struct HelperData {
    static let modelsEdit: [AddModel] = [AddModel(name: "Tổng quan", image: #imageLiteral(resourceName: "ic_tab_bar_dashboard")),
                                  AddModel(name: "Đơn hàng", image: #imageLiteral(resourceName: "ic_tab_bar_order")),
                                  AddModel(name: "Sản phẩm", image: #imageLiteral(resourceName: "ic_stock_permission")),
                                  AddModel(name: "Báo cáo", image: #imageLiteral(resourceName: "ic_tab_bar_report")),
                                  AddModel(name: "Thông báo", image: #imageLiteral(resourceName: "ic_tab_bar_notification")),
                                  AddModel(name: "Đối tác", image: #imageLiteral(resourceName: "ic_tab_bar_partner")),
                                  AddModel(name: "Cấu hình", image: #imageLiteral(resourceName: "ic_settings_permission")),
                                  AddModel(name: "Hỗ trợ", image: #imageLiteral(resourceName: "ic_more_support"))]
}
