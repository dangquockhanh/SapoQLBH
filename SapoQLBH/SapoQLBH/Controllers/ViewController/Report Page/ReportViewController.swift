//
//  ReportViewController.swift
//  SapoQLBH
//
//  Created by Đặng Khánh  on 7/31/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    @IBOutlet weak var banHangButton: UIButton!
    @IBOutlet weak var khoButton: UIButton!
    @IBOutlet weak var taiChinhButton: UIButton!
    @IBOutlet weak var banHangLabel: UILabel!
    @IBOutlet weak var khoLabel: UILabel!
    @IBOutlet weak var taiChinhLabel: UILabel!
    @IBOutlet weak var banHangView: UIView!
    @IBOutlet weak var khoView: UIView!
    @IBOutlet weak var taiChinhView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    let banHangDataSource = ReportDataSource(reportDataSourceType: .banHang)
    let khoDataSource = ReportDataSource(reportDataSourceType: .kho)
    let taiChinhDataSource = ReportDataSource(reportDataSourceType: .taiChinh)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupRefreshControl()
        registerCell()
    }
    
    func registerCell() {
        // Ban Hang Cell
        tableView.register(UINib(nibName: IdentifierManager.calendar, bundle: nil), forCellReuseIdentifier: IdentifierManager.calendar)
        tableView.register(UINib(nibName: IdentifierManager.realRevenue, bundle: nil), forCellReuseIdentifier: IdentifierManager.realRevenue)
        tableView.register(UINib(nibName: IdentifierManager.proceeds, bundle: nil), forCellReuseIdentifier: IdentifierManager.proceeds)
        tableView.register(UINib(nibName: IdentifierManager.profits, bundle: nil), forCellReuseIdentifier: IdentifierManager.profits)
        
        // Kho Cell
        tableView.register(UINib(nibName: IdentifierManager.khoCell, bundle: nil), forCellReuseIdentifier: IdentifierManager.khoCell)
        
        // Tai Chinh Cell
        tableView.register(UINib(nibName: IdentifierManager.taiChinhCell, bundle: nil), forCellReuseIdentifier: IdentifierManager.taiChinhCell)
    }
    
    func setupDefault() {
        clearStateSegment()
        setupSeclectedSegment(label: banHangLabel, underLineView: banHangView)
        tableView.dataSource = banHangDataSource
        tableView.delegate = banHangDataSource
    }
    
    func setupRefreshControl() {
        tableView.refreshControl = self.refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        fetchData()
        refreshControl.endRefreshing()
    }
    
    func fetchData() {
    }
    
    func setupSeclectedSegment(label: UILabel, underLineView: UIView) {
        let selectedColor = #colorLiteral(red: 0.2901960784, green: 0.5843137255, blue: 0.9254901961, alpha: 1)
        label.textColor = selectedColor
        underLineView.backgroundColor = selectedColor
    }
    
    func setupUnSelectedSegment(label: UILabel, underLineView: UIView) {
        label.textColor = .black
        underLineView.backgroundColor = .clear
    }
    
    func clearStateSegment() {
        setupUnSelectedSegment(label: banHangLabel, underLineView: banHangView)
        setupUnSelectedSegment(label: khoLabel, underLineView: khoView)
        setupUnSelectedSegment(label: taiChinhLabel, underLineView: taiChinhView)
    }
    
    @IBAction func segmentTapped(_ sender: UIButton) {
        clearStateSegment()
        switch sender {
        case banHangButton:
            setupSeclectedSegment(label: banHangLabel, underLineView: banHangView)
            tableView.dataSource = banHangDataSource
            tableView.delegate = banHangDataSource
        case khoButton:
            setupSeclectedSegment(label: khoLabel, underLineView: khoView)
            tableView.dataSource = khoDataSource
            tableView.delegate = khoDataSource
        default:
            setupSeclectedSegment(label: taiChinhLabel, underLineView: taiChinhView)
            tableView.dataSource = taiChinhDataSource
            tableView.delegate = taiChinhDataSource
        }
        
        // Update data
        tableView.reloadData()
    }
}


