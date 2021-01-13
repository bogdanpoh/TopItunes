//
//  AssemblyBuilder.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 27.12.2020.
//

import UIKit

protocol AssemblyModuleBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createSettingsModule(router: RouterProtocol) -> UIViewController
    func createPickerModule(router: RouterProtocol, title: String, data: [String]) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        view.title = "Itunes"
        view.presenter = presenter
        
        return view
    }
    
    func createSettingsModule(router: RouterProtocol) -> UIViewController {
        let view = SettingsViewController()
        let presenter = SettingsPresenter(view: view, router: router)
        
        view.title = "Settings"
        view.presenter = presenter
        
        return view
    }
    
    func createPickerModule(router: RouterProtocol, title: String, data: [String]) -> UIViewController {
        let view = PickerViewController()
        
        let presenter = PickerViewPresenter(view: view, router: router, data: data)
        
        view.title = title
        view.presenter = presenter
        
        return view
    }
}
