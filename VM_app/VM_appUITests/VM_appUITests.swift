//
//  VM_appUITests.swift
//  VM_appUITests
//
//  Created by Anumol Abraham Chakkungal on 27/05/2022.
//

import XCTest

class VM_appUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }



    func testBasicFlow() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        //Navigation Bar Exists and Home is Conatcts
        let navBar = app.navigationBars["Contacts"]
        XCTAssert(navBar.exists)
        
        //Tabbar exists
        let tabBar = app.tabBars["Tab Bar"]
        XCTAssert(tabBar.exists)
        
        //ContactTab exists
        let contactTab = tabBar.buttons["Contacts"]
        XCTAssert(contactTab.exists)
        
        //RoomTab exists
        let roomTab = tabBar.buttons["Rooms"]
        XCTAssert(roomTab.exists)
        
       
        //Tap on room
        let roomsButton = tabBar.buttons["Rooms"]
        roomsButton.tap()
        
        //Navigation Bar Exists and  is Room
        let navBarForRoom = app.navigationBars["Rooms"]
        XCTAssert(navBarForRoom.exists)
  
        
        //Recording
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).tap()
        
        let tablesQuery2 = tablesQuery
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["53539.0"]/*[[".cells.staticTexts[\"53539.0\"]",".staticTexts[\"53539.0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 2).staticTexts["No"].tap()
        tablesQuery.children(matching: .cell).element(boundBy: 3).tap()
        tablesQuery.children(matching: .cell).element(boundBy: 5).tap()
        tablesQuery.staticTexts["Room ID     3"].tap()
        tablesQuery.children(matching: .cell).element(boundBy: 6).tap()
        
        let staticText = tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["75480.0"]/*[[".cells.staticTexts[\"75480.0\"]",".staticTexts[\"75480.0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        staticText.tap()
        
        contactTab.tap()
        
        
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Maggie Brekke"]/*[[".cells.staticTexts[\"Maggie Brekke\"]",".staticTexts[\"Maggie Brekke\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Future Functionality Strategist"]/*[[".cells.staticTexts[\"Future Functionality Strategist\"]",".staticTexts[\"Future Functionality Strategist\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Id"]/*[[".cells.staticTexts[\"Id\"]",".staticTexts[\"Id\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Crystel.Nicolas61@hotmail.com"]/*[[".cells.staticTexts[\"Crystel.Nicolas61@hotmail.com\"]",".staticTexts[\"Crystel.Nicolas61@hotmail.com\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Created date").element/*[[".cells.containing(.staticText, identifier:\"Jan 24,2022\").element",".cells.containing(.staticText, identifier:\"Created date\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["pink"]/*[[".cells.staticTexts[\"pink\"]",".staticTexts[\"pink\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let contactsButton2 = app.navigationBars["Contacts"].buttons["Contacts"]
        contactsButton2.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Armando Weber"]/*[[".cells.staticTexts[\"Armando Weber\"]",".staticTexts[\"Armando Weber\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Principal Accounts Developer"]/*[[".cells.staticTexts[\"Principal Accounts Developer\"]",".staticTexts[\"Principal Accounts Developer\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".cells.staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Milton.Wisoky@gmail.com"]/*[[".cells.staticTexts[\"Milton.Wisoky@gmail.com\"]",".staticTexts[\"Milton.Wisoky@gmail.com\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Jan 24,2022"]/*[[".cells.staticTexts[\"Jan 24,2022\"]",".staticTexts[\"Jan 24,2022\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["sky blue"]/*[[".cells.staticTexts[\"sky blue\"]",".staticTexts[\"sky blue\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.cells.containing(.staticText, identifier:"Armando Weber").element.tap()
        contactsButton2.tap()
           

    }
    
    

}
