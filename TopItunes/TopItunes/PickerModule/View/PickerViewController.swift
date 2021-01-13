//
//  PickerViewController.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import UIKit

class PickerViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    var safeArea: UILayoutGuide!
    
    var presenter: PickerViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PickerTableViewCell.createNib(), forCellReuseIdentifier: PickerTableViewCell.identifier)
        
        view.addSubview(tableView)
        setupTableView()
    }
    
    private func setupTableView() {
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    private func setCheckMark(for indexPath: IndexPath) {

        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
}

