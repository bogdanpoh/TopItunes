//
//  SettingsViewProtocolExtension.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 09.01.2021.
//

import Foundation


extension SettingsViewController: SettingsViewProtocol {
    
    func loadSettings() {
        
        let indexCategory = UserDefaultManager.shared.loadInt(for: .musicCategory)
        let categoryArray = ChartURLBuilder.getItunesMusicCategory()
        titleCategory = categoryArray[indexCategory]
        
        
        let indexCountry = UserDefaultManager.shared.loadInt(for: .musicCount)
        let countryArray = ChartURLBuilder.getCountry()
        titleCountry = countryArray[indexCountry]
    }
    
}
