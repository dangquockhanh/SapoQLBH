//
//  ProductViewController.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 7/31/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProductCell()
        productTableView.separatorColor = .lightGray
    }
    
    func setupProductCell() {
        productTableView.register(UINib(nibName: IdentifierManager.productCell, bundle: nil), forCellReuseIdentifier: IdentifierManager.productCell)
        productTableView.register(UINib(nibName: IdentifierManager.productCellOne, bundle: nil), forCellReuseIdentifier: IdentifierManager.productCellOne)
        
    }
}

extension ProductViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = SectionType(rawValue: indexPath.row) else { return UITableViewCell() }
        switch cellType {
        case .one:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.productCell, for: indexPath) as? ProductCell else { return UITableViewCell() }
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case .two:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.productCellOne, for: indexPath) as? ProductCellOne else { return UITableViewCell() }
            cell.imageView?.image = #imageLiteral(resourceName: "ic_product_dashboard_products")
            cell.textLabel?.text = "Danh sách sản phẩm"
            cell.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
            return cell
        case .three:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.productCellOne, for: indexPath) as? ProductCellOne else { return UITableViewCell() }
            cell.imageView?.image = #imageLiteral(resourceName: "ic_product_dashboard_purchase_orders")
            cell.textLabel?.text = "Nhập hàng"
            cell.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
            
            return cell
        case .four:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.productCellOne, for: indexPath) as? ProductCellOne else { return UITableViewCell() }
            cell.imageView?.image = #imageLiteral(resourceName: "ic_product_dashboard_stock_adjustment")
            cell.textLabel?.text = "Kiểm hàng"
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1, 2, 3:
            return 60
        default:
            return 0
        }
    }
}
