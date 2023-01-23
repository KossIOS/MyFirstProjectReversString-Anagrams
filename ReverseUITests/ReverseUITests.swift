//
//  ReverseUITests.swift
//  ReverseUITests
//
//  Created by Konstantyn Koroban on 04/11/2022.
//

import XCTest

class ReverseUITests: XCTestCase {
    
    var textView: XCUIElement!
    var app: XCUIApplication!
    
    override func setUp()  {
        super.setUp()
        app = XCUIApplication()
        textView = app.textViews["resultTextView"]
        continueAfterFailure = false
        app.launch()
    }
    
    func testUIViewsExist() {
        XCTAssertTrue(app.textFields["reverseTextField"].exists)
        XCTAssertFalse(app.staticTexts["resultLabel"].exists)
        XCTAssertTrue(app.buttons["resultButton"].exists)
        XCTAssertTrue(app.segmentedControls.element.exists)
        XCTAssertTrue(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertFalse(app.textFields["ignoreCharactersTextField"].exists)
    }
    
    func testDefaultExclusion() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        var expectedOutcome = "namtaB looc 24/7"
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
        
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "abcd efgh", id: "reverseTextField")
        expectedOutcome = "dcba hgfe"
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
        
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "a1bcd efg!h", id: "reverseTextField")
        expectedOutcome = "d1cba hgf!e"
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
    
    func testCustomExclusionLetters() {
        enterStringInTextFieldById(phrase: "Foxminded cool 24/7", id: "reverseTextField")
        var expectedOutcome = "dexdnimoF oocl 7/42"
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "xl", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
        
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "abcd efgh", id: "reverseTextField")
        expectedOutcome = "dcba hgfe"
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
        
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "a1bcd efglh", id: "reverseTextField")
        expectedOutcome = "dcb1a hgfle"
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
    
    func testCustomExclusionDigits() {
        enterStringInTextFieldById(phrase: "Foxminded cool 24/7", id: "reverseTextField")
        let expectedOutcome = "dednimxoF looc /427"
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "1370", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
    
    func testCustomExclusionSymbols() {
        enterStringInTextFieldById(phrase: "Foxminded cool 24/7", id: "reverseTextField")
        let expectedOutcome = "dednimxoF looc 74/2"
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "/", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()
        XCTAssertEqual(textView.value as! String, expectedOutcome)
    }
    
    func testSegmentedControlTapChangeViews() {
        XCTAssertTrue(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertFalse(app.textFields["ignoreCharactersTextField"].exists)
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        XCTAssertFalse(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertTrue(app.textFields["ignoreCharactersTextField"].exists)
    }
    
    func testSegmentedControlTapHideResultLabel() {
        enterStringInTextFieldById(phrase: "abcd", id: "reverseTextField")
        app.buttons["resultButton"].tap()
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        XCTAssertFalse(app.staticTexts["resultTextView"].exists)
        enterStringInTextFieldById(phrase: "r", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()
        app.segmentedControls.children(matching: .button).element(boundBy: 0).tap()
        XCTAssertFalse(app.staticTexts["resultTextView"].exists)
    }
    
    private func enterStringInTextFieldById(phrase: String, id: String) {
        let textField = app.textFields[id]
        textField.tap()
        textField.typeText(phrase)
    }
    
    private func clearTextField(id: String) {
        app.textFields[id].press(forDuration: 1.2)
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
    }
}

