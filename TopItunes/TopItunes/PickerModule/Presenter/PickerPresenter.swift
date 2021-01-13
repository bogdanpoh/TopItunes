//
//  PickerPresenter.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 10.01.2021.
//

import Foundation

protocol PickerViewProtocol: class {
    func succes()
    func failed(error: Error)
}

protocol PickerViewPresenterProtocol: class {
    var data: [String]? { get set }
    
    init(view: PickerViewProtocol, router: RouterProtocol,  data: [String]?)
    
    func setData()
    func loadPick(for key: UserDefaultManager.UserDefaultKey) -> Int
    func loadPick(for key: UserDefaultManager.UserDefaultKey) -> Bool
    func saveItem(for key: UserDefaultManager.UserDefaultKey, item: Int)
    func saveItem(for key: UserDefaultManager.UserDefaultKey, item: Bool)
    func backToMain()
}

class PickerViewPresenter: PickerViewPresenterProtocol {

    weak var view: PickerViewProtocol?
    var router: RouterProtocol?
    var data: [String]?
    
    required init(view: PickerViewProtocol, router: RouterProtocol, data: [String]?) {
        self.view = view
        self.data = data
        self.router = router
        setData()
    }

    func setData() {
        
        if self.data != nil {
            self.view?.succes()
        } else {
            
            let error = NSError(domain: "Fields is empty", code: 99, userInfo: nil)
            
            self.view?.failed(error: error)
        }
        
    }
    
    func loadPick(for key: UserDefaultManager.UserDefaultKey) -> Int {
        return UserDefaultManager.shared.loadInt(for: key)
    }
    
    func loadPick(for key: UserDefaultManager.UserDefaultKey) -> Bool {
        return UserDefaultManager.shared.loadBool(for: key)
    }
    
    func saveItem(for key: UserDefaultManager.UserDefaultKey, item: Int) {
        UserDefaultManager.shared.save(value: item, for: key)
    }
    
    func saveItem(for key: UserDefaultManager.UserDefaultKey, item: Bool) {
        UserDefaultManager.shared.save(value: item, for: key)
    }
    
    func backToMain() {
        router?.popToRoot()
    }
}
