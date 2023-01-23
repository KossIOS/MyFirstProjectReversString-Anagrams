//
//  MyFirstProjectReversStringUITests.swift
//  MyFirstProjectReversStringUITests
//
//  Created by Konstantyn Koroban on 27/09/2022.
//

import XCTest

class ReverserUITests: XCTestCase {
    
    var app: XCUIApplication!
    var textView: XCUIElement!
    var dismissKeyboardButton: XCUIElement!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        textView = app.textViews["ResultTextView"]
        dismissKeyboardButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        app.launch()
    }
    
    func testReverseTwoWords() {
        let expectedOutcome = "tseT gnirts"
        app.textFields["Text to reverse"].tap()
        app.textFields["Text to reverse"].typeText("Test string")
        dismissKeyboardButton.tap()
        app.buttons["ResultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
    
    func testLongStringReverse() {
        let expectedOutcome = "tfiwS sedulcni nredom serutaef ekil epyt ecnerefni"
        app.textFields["Text to reverse"].tap()
        app.textFields["Text to reverse"].typeText("Swift includes modern features like type inference")
        dismissKeyboardButton.tap()
        app.buttons["ResultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
    
    func testShortStringReverse() {
        let expectedOutcome = "tfiwS"
        app.textFields["Text to reverse"].tap()
        app.textFields["Text to reverse"].typeText("Swift")
        dismissKeyboardButton.tap()
        app.buttons["ResultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
}


