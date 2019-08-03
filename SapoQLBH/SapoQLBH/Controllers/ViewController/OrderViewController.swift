//
//  OrderViewController.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 7/31/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

enum OrderCellType: Int {
    case one = 0
    case two
    case three
    case four
    case five
    case six
}

class OrderViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOrderCell()
    
    }
    
    func setupOrderCell() {
        orderTableView.register(UINib(nibName: IdentifierManager.orderCell, bundle: nil), forCellReuseIdentifier: IdentifierManager.orderCell)
         orderTableView.register(UINib(nibName: IdentifierManager.orderCellOne, bundle: nil), forCellReuseIdentifier: IdentifierManager.orderCellOne)
         orderTableView.register(UINib(nibName: IdentifierManager.orderCellTwo, bundle: nil), forCellReuseIdentifier: IdentifierManager.orderCellTwo)
         orderTableView.register(UINib(nibName: IdentifierManager.orderCellSeparator, bundle: nil), forCellReuseIdentifier: IdentifierManager.orderCellSeparator)
    }
}

extension OrderViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cellType = OrderCellType(rawValue: indexPath.row) else { return UITableViewCell() }
        switch cellType  {
        case .one:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.orderCell, for: indexPath) as? OrderCell else { return UITableViewCell() }
            return cell
        case .two:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.orderCellOne, for: indexPath) as? OrderCellOne else { return UITableViewCell() }
            cell.textLabel?.text = "Danh sách đơn hàng"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_order_dashboard_orders")
             cell.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
            return cell
        case .three:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.orderCellOne, for: indexPath) as? OrderCellOne else { return UITableViewCell() }
            cell.textLabel?.text = "Khách trả hàng"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_order_dashboard_order_returns")
            cell.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
            return cell
        case .four:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.orderCellOne, for: indexPath) as? OrderCellOne else { return UITableViewCell() }
            cell.textLabel?.text = "Quản lý giao hàng"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_order_dashboard_shipments")
            return cell
        case .five:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.orderCellSeparator, for: indexPath) as? OrderCellSeparator else { return UITableViewCell() }
            return cell
       case .six:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.orderCellTwo, for: indexPath) as? OrderCellTwo else { return UITableViewCell() }
            return cell
        }
    }
}

extension OrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1, 2, 3:
            return 60
        case 4:
            return 20
        case 5:
            return 60
        default:
            return CGFloat()
        }
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//    }
}

