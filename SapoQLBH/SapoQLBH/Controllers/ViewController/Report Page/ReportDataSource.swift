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
    var reportDataSourceType: ReportDataSourceType
    
    init(reportDataSourceType: ReportDataSourceType) {
        self.reportDataSourceType = reportDataSourceType
    }
}

extension ReportDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch reportDataSourceType {
        case .banHang:
            return 5
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
                return cell
            case .two:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.realRevenue, for: indexPath) as? RealRevenue else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            case .three:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.proceeds, for: indexPath) as? Proceeds  else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            case .four:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.profits, for: indexPath) as? Profits  else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            default:
                return defaultCell
            }
        
        case .kho:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.khoCell, for: indexPath) as? KhoCell else { return UITableViewCell() }
            return cell
        default:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.taiChinhCell, for: indexPath) as? TaiChinhCell else { return UITableViewCell() }
         
            return cell
        }
    }
}

extension ReportDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                switch indexPath.row {
                case 1:
                    return 150
                case 2, 3:
                    return 300
      
                default:
                    return 50
                }
            }
        }
