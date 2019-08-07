//
//  MainTabBarViewController.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 7/31/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class MainTabBarViewController: UIViewController {

    let tabBarControl = UITabBarController()
    let addViewController = AddViewController.newInstance()
    
    lazy var listTabBars: [UIViewController] = {
        let firstVC = self.createItemTabBar(SurveyViewController.newInstance(), title: "Tổng quan", image: UIImage(named: "ic_tab_bar_dashboard"))
        let secondVC = self.createItemTabBar(OrderViewController.newInstance(), title: "Đơn hàng", image: UIImage(named: "ic_tab_bar_order"))
        let threeVC = self.createItemTabBar(ProductViewController.newInstance(), title: "Sản phẩm", image: UIImage(named: "ic_tab_bar_product"))
        let fourVC = self.createItemTabBar(ReportViewController.newInstance(), title: "Báo cáo", image: UIImage(named: "ic_tab_bar_report"))
        let fiveVC = self.createItemTabBar(UIViewController(), title: "Thông báo", image: UIImage(named: "ic_tab_bar_notification"))
        let sixVC = self.createItemTabBar(UIViewController(), title: "Đối tác", image: UIImage(named: "ic_tab_bar_partner"))
        
        return [firstVC, secondVC, threeVC, fourVC, fiveVC, sixVC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDefault()
        NotificationCenter.default.addObserver(self, selector: #selector(handleMoveCell(_:)), name: NSNotification.Name(rawValue: "MoveCell"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupDefault() {
        tabBarControl.tabBar.tintColor = #colorLiteral(red: 0.1607843137, green: 0.4274509804, blue: 0.7725490196, alpha: 1)
        self.view.addSubview(tabBarControl.view)
        self.setupItemsTabBar(with: self.listTabBars)
    }
    
    private func setupItemsTabBar(with controllers: [UIViewController]) {
        var tempControllers = controllers
        let fiveVC = self.createItemTabBar(self.addViewController, title: "Thêm", image: UIImage(named: "ic_tab_bar_more"))
        tempControllers.insert(fiveVC, at: 4)
        let displayControllers = Array(tempControllers.prefix(5))
        tabBarControl.viewControllers = displayControllers
    }
    
    func createItemTabBar(_ controller: UIViewController, title: String, image: UIImage?, tag: Int = 0) -> UIViewController {
        controller.title = title
        controller.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0) // Set background color for app
        controller.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return controller
    }
    
    @objc func handleMoveCell(_ notification: Notification) {
        if let listIndex = notification.userInfo?["listIndex"] as? [Int] {
            var newControllers: [UIViewController] = []
            for index in listIndex {
                newControllers.append(self.listTabBars[index])
            }
            self.setupItemsTabBar(with: newControllers)
        }
    }
}
