//
//  RouterTest.swift
//  TopItunesTests
//
//  Created by Bogdan Pohidnya on 04.01.2021.
//

import XCTest
@testable import TopItunes

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        self.pushViewController(viewController, animated: animated)
    }
}

class RouterTest: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assemblyBuilder = AssemblyModuleBuilder()
    
    override func setUp() {
        router = Router(navigationController: navigationController, assemblyModuleBuilder: assemblyBuilder)
    }
    
    override func tearDown() {
        router = nil
    }
    
    func testRouter() {
        router.showDetail(chart: Chart)
        let detailViewController = navigationController.presentedVC
        
        XCTAssertTrue(detailViewController is DetailViewController)
    }
    
//    override func setUpWithError() throws {
//
//
//    }
//
//    override func tearDownWithError() throws {
//
//    }

}
