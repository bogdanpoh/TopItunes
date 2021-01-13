//
//  PickerViewProtocolExtension.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import Foundation

extension PickerViewController: PickerViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failed(error: Error) {
        
        print(error)
        
        presenter.backToMain()
    }
    
}
