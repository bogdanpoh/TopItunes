//
//  SettingsViewController.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 07.01.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    
    var presenter: SettingsViewPresenterProtocol!
    let tableView = UITableView(frame: .zero, style: .grouped)
    var safeArea: UILayoutGuide!

    let titleCells = ["Source", "Category", "Country", "Number of response", "Explicit"]

    var titleCategory: String!
    var titleCountry: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(tableView)
        setupTableView()
        
        tableView.register(SettingsTableViewCell.createUINib(),
                           forCellReuseIdentifier: SettingsTableViewCell.identifiable)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.loadSettings()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }

}
