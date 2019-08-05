//
//  ReportDataSource.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 8/4/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

enum ReportDataSourceType {
    case banHang
    case kho
    case taiChinh
}

class ReportDataSource: NSObject {
    let  storeList: [String] = ["Báo cáo tồn kho", "Số kho", "Xuất nhập tồn", "Báo cáo dưới định mức", "Báo cáo vượt định mức"]
    let  financeList: [String] = ["Sổ quỹ", "Báo cáo lãi lỗ", "Báo cáo công nợ phải thu","Báo cáo công nợ phải thu"]
    
    var reportDataSourceType: ReportDataSourceType
    
    init(reportDataSourceType: ReportDataSourceType) {
        self.reportDataSourceType = reportDataSourceType
    }
}

extension ReportDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch reportDataSourceType {
        case .banHang:
            return 4
        case .kho:
            return 5
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
//          cell.selectionStyle = .none
        switch reportDataSourceType {
        case .banHang:
        guard let cellType = SectionType(rawValue: indexPath.row) else { return defaultCell }
            switch cellType {
            case .one:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.calendar, for: indexPath) as? Calendar else { return UITableViewCell() }
                cell.selectionStyle = .none
                   cell.separatorInset = UIEdgeInsets(top: 0, left: 414, bottom: 0, right: 0)
                return cell
            case .two:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.realRevenue, for: indexPath) as? RealRevenue else { return UITableViewCell() }
                cell.selectionStyle = .none
                   cell.separatorInset = UIEdgeInsets(top: 0, left: 414, bottom: 0, right: 0)
                return cell
            case .three:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.proceeds, for: indexPath) as? Proceeds  else { return UITableViewCell() }
                cell.selectionStyle = .none
                   cell.separatorInset = UIEdgeInsets(top: 0, left: 414, bottom: 0, right: 0)
                return cell
            case .four:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.profits, for: indexPath) as? Profits  else { return UITableViewCell() }
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: 414, bottom: 0, right: 0)
                return cell
            default:
                return defaultCell
            }
        
        case .kho:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.khoCell, for: indexPath) as? KhoCell else { return UITableViewCell() }
           cell.textLabel?.text = storeList[indexPath.row]
            return cell
        default:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.taiChinhCell, for: indexPath) as? TaiChinhCell else { return UITableViewCell() }
           cell.textLabel?.text = financeList[indexPath.row]
            return cell
        }
    }
}

extension ReportDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch reportDataSourceType {
        case .banHang:
            guard let sizeCell = SectionType(rawValue: indexPath.row) else { return 0}
            switch sizeCell {
                case .one:
                    return 50
                case .two:
                    return 120
                case .three, .four:
                    return 300
                default:
                    return 50
                }
        case .kho:
            return 50
        case .taiChinh:
            return 50
        }
        }
}
