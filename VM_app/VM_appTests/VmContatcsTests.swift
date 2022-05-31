//
//  VmContatcsTests.swift
//  VM_appTests
//
//  Created by Anumol Abraham Chakkungal on 31/05/2022.
//

import XCTest
@testable import VM_app


class VmContatcsTests: XCTestCase {
    
    var viewModel = VmContatcsViewModel()


    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }

    func testCallFuncToGetValidCharectersData() {
        
        let route = Router.getContatcs
        let expectations = self.expectation(description: "GotContact")

        NetworkService.request(router: route) { (result: Result<[VmContact], Error>) in
            // ASSERT
            switch result {
            case .success(let result):
                XCTAssertNotNil(result)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectations.fulfill()
        }
        waitForExpectations(timeout: 0.6, handler: nil)
    }
    
}
