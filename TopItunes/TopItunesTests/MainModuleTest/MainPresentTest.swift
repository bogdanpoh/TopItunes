//
//  MainPresentTest.swift
//  TopItunesTests
//
//  Created by Bogdan Pohidnya on 04.01.2021.
//

import XCTest

@testable import TopItunes

class MockView: MainViewProtocol {
    
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
    
    func tapOnSettings(_ sender: UITabBarItem) {
        
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var chart: [Chart]!
    
    init() {}
    
    convenience init(chart: [Chart]) {
        self.init()
        self.chart = chart
    }
    
    func getChart(urlString: String, completion: @escaping (Result<[Chart]?, Error>) -> Void) {
        if let chart = chart {
            completion(.success(chart))
        } else {
            let error = NSError(domain: "Failed get chart", code: 0, userInfo: nil)
            
            completion(.failure(error))
        }
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        //TODO
    }
}

class MainPresenterTest: XCTestCase {
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var chart = [Chart]()
    
    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyModuleBuilder()
        
        router = Router(navigationController: navigationController, assemblyModuleBuilder: assemblyBuilder)
    }
    
    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        networkService = nil
    }
    
    func testGetSuccessChart() {
        let chartItem = Chart(artistName: "Boo",
                              id: "Nul",
                              releaseDate: nil,
                              name: "Allan",
                              collectionName: nil,
                              kind: "Kindi",
                              copyright: nil,
                              artistId: nil,
                              contentAdvisoryRating: nil,
                              artistUrl: nil,
                              artworkUrl100: "Urli",
                              url: "Urla")
        
        chart.append(chartItem)
        
        view = MockView()
        networkService = MockNetworkService(chart: chart)
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchChart: [Chart]?
        
        networkService.getChart(urlString: "string") { result in
            switch result {
            case .success(let chart):
                catchChart = chart
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchChart?.count, 0)
        XCTAssertEqual(catchChart?.count, chart.count)
    }
    
    func testGetFailureChart() {
        let chartItem = Chart(artistName: "Boo",
                              id: "Nul",
                              releaseDate: nil,
                              name: "Allan",
                              collectionName: nil,
                              kind: "Kindi",
                              copyright: nil,
                              artistId: nil,
                              contentAdvisoryRating: nil,
                              artistUrl: nil,
                              artworkUrl100: "Urli",
                              url: "Urla")
        
        chart.append(chartItem)
        
        view = MockView()
        networkService = MockNetworkService()
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getChart(urlString: "url") { result in
            switch result {
            case .success(let chart): break
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }
}
