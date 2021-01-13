//
//  SettingsPresenter.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 07.01.2021.
//

import Foundation


protocol SettingsViewProtocol: class {
    func loadSettings()
}

protocol SettingsViewPresenterProtocol: class {
    init(view: SettingsViewProtocol, router: RouterProtocol)
    
    func loadSettings()
    func showItunesCategoryPicker()
    func showCountryPicker()
}

class SettingsPresenter: SettingsViewPresenterProtocol {
    
    weak var view: SettingsViewProtocol?
    let router: RouterProtocol?
    
    required init(view: SettingsViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func loadSettings() {
        view?.loadSettings()
    }
    
    func showItunesCategoryPicker() {
        
        let data = ChartURLBuilder.getItunesMusicCategory()
        let title = "Category"
        
        router?.showPicker(title: title, data: data)
    }
    
    func showCountryPicker() {
        
        let data = ChartURLBuilder.getCountry()
        let title = "Country"
        
        router?.showPicker(title: title, data: data)
    }
    
}
