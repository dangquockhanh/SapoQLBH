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
    @IBOutlet weak var iconButton: UIBarButtonItem!
    
    var isEdit: Bool = false {
        didSet {
            iconButton.image = isEdit ? #imageLiteral(resourceName: "CloseIcon") : #imageLiteral(resourceName: "EditIcon")
            self.addTableView.isEditing = isEdit
        }
    }
    
    let models: [AddModel] = [AddModel(name: "Thông báo", image: #imageLiteral(resourceName: "ic_tab_bar_notification")),
                              AddModel(name: "Đối tác", image: #imageLiteral(resourceName: "ic_customer_menu")),
                              AddModel(name: "Cấu hình", image: #imageLiteral(resourceName: "ic_settings_permission")),
                              AddModel(name: "Hỗ trợ", image: #imageLiteral(resourceName: "ic_more_support"))]
    
    var newModelsEdit: [AddModel] = []
    var listIndex: [Int] = [Int](0...5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddCell()
        self.isEdit = false
        self.newModelsEdit = HelperData.modelsEdit
    }
    
    static func newInstance() -> AddViewController {
        return (Supports.instantiateViewController(IdentifierManager.add, with: IdentifierManager.addViewController) as? AddViewController) ?? AddViewController()
    }
    
    func setupAddCell() {
        addTableView.register(UINib(nibName: IdentifierManager.addCell, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCell)
        addTableView.register(UINib(nibName: IdentifierManager.addCellOne, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellOne)
        addTableView.register(UINib(nibName: IdentifierManager.addCellTwo, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellTwo)
        addTableView.register(UINib(nibName: IdentifierManager.addCellThree, bundle: nil), forCellReuseIdentifier: IdentifierManager.addCellThree)
    }

    @IBAction func EditTapped(_ sender: Any) {
        self.isEdit = !self.isEdit
        self.addTableView.reloadData()
    }
}

extension AddViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            if isEdit {
            
                return newModelsEdit.count
            }
            return models.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCell, for: indexPath) as? AddCell else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellOne, for: indexPath) as? AddCellOne else { return UITableViewCell() }
            cell.textLabel?.text = isEdit ? self.newModelsEdit[indexPath.row].name : self.models[indexPath.row].name
            cell.imageView?.image = isEdit ? self.newModelsEdit[indexPath.row].image : self.models[indexPath.row].image
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellThree, for: indexPath) as? AddCellThree else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierManager.addCellTwo, for: indexPath) as? AddCellTwo else { return UITableViewCell() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.section {
        case 1:
            if indexPath.row > 5 {
                return false
            }
            
            return true
        default:
            return false
        }
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let move = newModelsEdit[sourceIndexPath.row]
        newModelsEdit.remove(at: sourceIndexPath.row)
        newModelsEdit.insert(move, at: destinationIndexPath.row)
        let indexChange = listIndex[sourceIndexPath.row]
        listIndex.remove(at: sourceIndexPath.row)
        listIndex.insert(indexChange, at: destinationIndexPath.row)
        
        let userInfo: [String: Any] = ["listIndex": listIndex]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "MoveCell"), object: nil, userInfo: userInfo)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

}

extension AddViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
}
