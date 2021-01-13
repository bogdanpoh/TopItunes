//
//  DelegateExtension.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 09.01.2021.
//

import UIKit

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.cellForRow(at: indexPath)?.isSelected = false
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            presenter.showItunesCategoryPicker()
        } else if indexPath.row == 2 {
            presenter.showCountryPicker()
        }
        
    }
}
