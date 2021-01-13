//
//  MainViewProtocolExtension.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import UIKit

extension MainViewController: MainViewProtocol {

    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print("Error when show data in view")
        print(error)
    }
    
    @objc func tapOnSettings(_ sender: UITabBarItem) {
        presenter.tapOnSettings()
    }
    
}
