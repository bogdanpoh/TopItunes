//
//  DataSourceExtension.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 09.01.2021.
//

import UIKit

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifiable,
                                                 for: indexPath) as! SettingsTableViewCell
        
        let titleCell = titleCells[indexPath.row]
        
        if indexPath.row == 0 {
            cell.setupCell(title: titleCell, secondaryTitle: nil, cellStyle: .sourceSegment, segmentIndex: 0)
        } else if indexPath.row == 1 {
            
            cell.setupCell(title: titleCell, secondaryTitle: titleCategory, cellStyle: .categoryPicker)
        } else if indexPath.row == 2 {
            cell.setupCell(title: titleCell, secondaryTitle: titleCountry, cellStyle: .countryPicker)
        } else if indexPath.row == 3 {
            cell.setupCell(title: titleCell, secondaryTitle: nil, cellStyle: .numberOfStepper, stepperValue: 10)
        } else if indexPath.row == 4 {
            cell.setupCell(title: titleCell, secondaryTitle: nil, cellStyle: .explicitSwitch, switcherIsOn: false)
        }
        
        return cell
    }
}
