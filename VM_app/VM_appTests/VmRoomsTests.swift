//
//  VmRoomsTests.swift
//  VM_appTests
//
//  Created by Anumol Abraham Chakkungal on 31/05/2022.
//

import XCTest
@testable import VM_app

class VmRoomsTests: XCTestCase {
    
    var viewModel = VmAvailableRoomViewModel()


    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }


    func testCallFuncToGetValidCharectersData() {
        
        let route = Router.getAvailableRooms
        let expectations = self.expectation(description: "GotRooms")

        NetworkService.request(router: route) { (result: Result<[VmRoom], Error>) in
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
