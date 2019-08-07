//
//  SurveyViewController.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 7/31/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.registerCell()
        self.setupRefreshControl()
    }
    
    static func newInstance() -> SurveyViewController {
        return (Supports.instantiateViewController(IdentifierManager.survey, with: IdentifierManager.surveyViewController) as? SurveyViewController) ?? SurveyViewController()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: IdentifierManager.surveyTableViewCellOne, bundle: nil), forCellReuseIdentifier: IdentifierManager.surveyTableViewCellOne)
        tableView.register(UINib(nibName: IdentifierManager.surveyTableViewCellTwo, bundle: nil), forCellReuseIdentifier: IdentifierManager.surveyTableViewCellTwo)
        tableView.register(UINib(nibName: IdentifierManager.surveyTableViewCellThree, bundle: nil), forCellReuseIdentifier: IdentifierManager.surveyTableViewCellThree)
        tableView.register(UINib(nibName: IdentifierManager.surveyTableViewCellFour, bundle: nil), forCellReuseIdentifier: IdentifierManager.surveyTableViewCellFour)
        tableView.register(UINib(nibName: IdentifierManager.surveyTableViewCellFive, bundle: nil), forCellReuseIdentifier: IdentifierManager.surveyTableViewCellFive)
    }
    
    fileprivate func setupRefreshControl() {
        self.tableView.refreshControl = refreshControl
        // Add actions for refresh control
        self.refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        // Custom title refresh control
//        self.refreshControl.attributedTitle = NSAttributedString(string: "Loading...")
        // Custom tint color of refresh color
//        self.refreshControl.tintColor = .red
    }
    
    @objc func handleRefreshControl() {
        // Handle data before end refresh control
        self.fetchData()
    }
    
    // Handle fetch data from server
    private func fetchData() {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension SurveyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        // Using enum servey cell type
        // Check before using
        guard let cellType = SectionType(rawValue: indexPath.row) else { return defaultCell }
        
        switch cellType {
        case .one:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.surveyTableViewCellOne, for: indexPath) as? SurveyTableCell else {
                return defaultCell
            }
            cell.dateLabel.text = "7 ngày qua"
            cell.durationLabel.text = "25 thg 7 - 31 thg 7"
            return cell
        case .two:
            guard let cell = tableView.dequeueReusableCell(withIdentifier:IdentifierManager.surveyTableViewCellTwo, for: indexPath) as? SurveyCellTwo else {
                return defaultCell
            }
            return cell
        case .three:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.surveyTableViewCellThree, for: indexPath) as? SurveyCellThree else {
                return defaultCell
            }
             return cell
        case .four:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.surveyTableViewCellFour, for: indexPath) as? SurveyCellFour else {
                return defaultCell
            }
            return cell
        case .five:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.surveyTableViewCellFive, for: indexPath) as? SurveyCellFive else {
                return defaultCell
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension SurveyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = SectionType(rawValue: indexPath.row) else { return 0 }
        
        switch cellType {
        case .one:
            return 70
        case .two:
            return 170
        case .three:
            return 150
        case .four, .five:
            return 350
        default:
            return 0
        }
    }
}
