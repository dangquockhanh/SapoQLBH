//
//  AddViewController.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 7/31/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddCell()
    }
    
    func setupAddCell() {
        addTableView.register(UINib(nibName: IdentifierManager.addCell, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCell)
        addTableView.register(UINib(nibName: IdentifierManager.addCellSeparatorOne, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellSeparatorOne)
        addTableView.register(UINib(nibName: IdentifierManager.addCellOne, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellOne)
        addTableView.register(UINib(nibName: IdentifierManager.addSeparatorCellTwo, bundle: nil), forCellReuseIdentifier: IdentifierManager.addSeparatorCellTwo)
        addTableView.register(UINib(nibName: IdentifierManager.addCellTwo, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellTwo)
        addTableView.register(UINib(nibName: IdentifierManager.addCellThree, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellThree)
    }

}

extension AddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = SectionType(rawValue: indexPath.row) else { return UITableViewCell() }
        switch cellType {
        case .one:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCell, for: indexPath) as? AddCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case .three:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellOne, for: indexPath) as? AddCellOne else { return UITableViewCell() }
            cell.textLabel?.text = "Đối tác"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_customer_menu")
              cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
            return cell
        case .four:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellOne, for: indexPath) as? AddCellOne else { return UITableViewCell() }
           cell.textLabel?.text = "Thông báo"
           cell.imageView?.image = #imageLiteral(resourceName: "ic_tab_bar_notification")
            return cell
        case .five:
             guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellOne, for: indexPath) as? AddCellOne else { return UITableViewCell() }
             cell.textLabel?.text = "Cấu hình"
             cell.imageView?.image = #imageLiteral(resourceName: "ic_more_settings")
            return cell
        case .six:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellOne, for: indexPath) as? AddCellOne else { return UITableViewCell() }
            cell.textLabel?.text = "Hỗ trợ"
            cell.imageView?.image = #imageLiteral(resourceName: "ic_more_support")
              cell.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
            return cell
        case .eight:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellTwo, for: indexPath) as? AddCellTwo else { return UITableViewCell() }
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case .ten:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellThree, for: indexPath) as? AddCellThree else { return UITableViewCell() }
             cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        }
    }
}

extension AddViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
           return 80
        case 1:
            return 15
        case 2, 3, 4, 5:
            return 50
        case 6, 8:
            return 15
        case 7, 9:
            return 50
        default:
            return 0
        }
    }
}
