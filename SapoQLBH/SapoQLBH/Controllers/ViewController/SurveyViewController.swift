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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: identifierManager.surveyTableViewCellOne, bundle: nil), forCellReuseIdentifier: identifierManager.surveyTableViewCellOne)
        tableView.register(UINib(nibName: identifierManager.surveyTableViewCellTwo, bundle: nil), forCellReuseIdentifier: identifierManager.surveyTableViewCellTwo)
        tableView.register(UINib(nibName: identifierManager.surveyTableViewCellThree, bundle: nil), forCellReuseIdentifier: identifierManager.surveyTableViewCellThree)
        tableView.register(UINib(nibName: identifierManager.surveyTableViewCellFour, bundle: nil), forCellReuseIdentifier: identifierManager.surveyTableViewCellFour)
        tableView.register(UINib(nibName: identifierManager.surveyTableViewCellFive, bundle: nil), forCellReuseIdentifier: identifierManager.surveyTableViewCellFive)
    }
}

// MARK: - UITableViewDataSource
extension SurveyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierManager.surveyTableViewCellOne, for: indexPath) as? SurveyTableCell
            cell?.dateLabel.text = "7 ngày qua"
            cell!.durationLabel.text = "25 thg 7 - 31 thg 7"
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier:identifierManager.surveyTableViewCellTwo, for: indexPath) as? SurveyCellTwo
            return cell!
        case 2:
             let cell = tableView.dequeueReusableCell(withIdentifier: identifierManager.surveyTableViewCellThree, for: indexPath) as? SurveyCellThree
             return cell!
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierManager.surveyTableViewCellFour, for: indexPath) as? SurveyCellFour
            return cell!
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierManager.surveyTableViewCellFive, for: indexPath) as? SurveyCellFive
            return cell!
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension SurveyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 70
        case 1:
            return 170
        case 2:
            return 150
        case 3:
            return 350
        case 4:
            return 350

        default:
            return CGFloat(0)
        }
    }
}
