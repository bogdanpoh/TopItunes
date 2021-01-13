//
//  MainPresenter.swift
//  TopItunes
//
//  Created by Bogdan Pohidnya on 27.12.2020.
//

import UIKit

protocol MainViewProtocol: class {
    func success()
    func failure(error: Error)
    func tapOnSettings(_ sender: UITabBarItem)
}

protocol MainViewPresenterProtocol: class {
    var chart: [Chart]? { get set }
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    
    func getChart()
    
    func tapOnSettings()
    
    func tapOnChartItem(chart: Chart)
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var chart: [Chart]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        
        getChart()
    }
    
    //MARK: - Business Logic
    
    func tapOnSettings() {
        router?.showSettings()
    }
    
    func getChart() {
        
//        let urlString = "https://rss.itunes.apple.com/api/v1/ua/itunes-music/hot-tracks/all/100/non-explicit.json"
        
        let urlString = ChartURLBuilder(musicSource: .itunes,
                                        musicCategory: .hotTracks,
                                        musicCountry: .ua,
                                        musicExplicit: .explicit).getURLString()
        
        networkService.getChart(urlString: urlString) { [weak self] result in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let chart):
                    self.chart = chart
                    self.view?.success()
                    
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnChartItem(chart: Chart) {
        
    }
    
}
