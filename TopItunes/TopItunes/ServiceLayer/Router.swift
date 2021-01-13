//
//  Router.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 27.12.2020.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showSettings()
    func showPicker(title: String, data: [String])
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol?
    
    init(navigationController: UINavigationController,
         assemblyModuleBuilder: AssemblyModuleBuilder) {
        
        self.navigationController = navigationController
        self.assemblyModuleBuilder = assemblyModuleBuilder
    }
    
    func initialViewController() {
        
        if let navigationController = navigationController {
            guard let mainViewController = assemblyModuleBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showSettings() {
        if let navigationController = navigationController {
            guard let settingsViewController = assemblyModuleBuilder?.createSettingsModule(router: self) else { return }
            navigationController.pushViewController(settingsViewController, animated: true)
        }
    }
    
    func showPicker(title: String, data: [String]) {
        if let navigationController = navigationController {
            guard let pickerViewController = assemblyModuleBuilder?.createPickerModule(router: self,
                                                                                       title: title,
                                                                                       data: data) else { return }
            navigationController.pushViewController(pickerViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
