//
//  ViewController.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 27.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(tapOnSettings(_:)))
        
        tableView.register(MainTableViewCell.createUINib(), forCellReuseIdentifier: MainTableViewCell.mainCellId)
        tableView.dataSource = self
        tableView.delegate = self
    }
}
