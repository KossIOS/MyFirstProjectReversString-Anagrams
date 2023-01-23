//
//  ReverseUnitTests.swift
//  ReverseUnitTests
//
//  Created by Konstantyn Koroban on 04/11/2022.
//

import XCTest
@testable import MyFirstProjectMyFirstProjectReversString

class ReverseUnitTests: XCTestCase {
    
    var sut: ReversePhrase!
    
    override func setUp() {
        sut = ReversePhrase()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testReversePhraseEmptyString() {
        XCTAssert(sut.reverse(phrase: "").isEmpty)
    }
    
    func testReversePhraseEmptyStringEmptyExclusion() {
        XCTAssert(sut.reverse(phrase: "", ignoredCharacters: "").isEmpty)
    }
    
    func testReversePhraseDefaultExclusion() {
        var string = "abcd efgh"
        var expectedString = "dcba hgfe"
        XCTAssertEqual(expectedString, sut.reverse(phrase: string))
        
        string = "a1bcd efg!h"
        expectedString = "d1cba hgf!e"
        XCTAssertEqual(expectedString, sut.reverse(phrase: string))
    }
    
    func testReversePhraseSingleWordString() {
        let input = "Swift"
        let expectedString = "tfiwS"
        XCTAssertEqual(expectedString, sut.reverse(phrase: input))
    }
    
    func testReversePhraseStringEmptyExclusion() {
        let input = "a1bcd efg!h"
        let ignoredCharacters = ""
        let expectedString = "dcb1a h!gfe"
        XCTAssertEqual(expectedString, sut.reverse(phrase: input, ignoredCharacters: ignoredCharacters))
    }
    
    func testReversePhraseStringCustomExclusion() {
        let input = "Foxminded cool 24/7"
        let ignoredCharacters = "Foxminded"
        let expectedString = "Foxminded looc 7/42"
        XCTAssertEqual(expectedString, sut.reverse(phrase: input, ignoredCharacters: ignoredCharacters))
    }
    
    func testReversePhraseEmptyStringCustomExclusion() {
        XCTAssert(sut.reverse(phrase: "", ignoredCharacters: "123").isEmpty)
    }
    
    func testReversePhraseStringCustomExclusionCharacters() {
        let ignoredCharacters = "xl"
        var input = "Foxminded cool 24/7"
        var expectedString = "dexdnimoF oocl 7/42"
        XCTAssertEqual(expectedString, sut.reverse(phrase: input, ignoredCharacters: ignoredCharacters))
        
        input = "abcd efgh"
        expectedString = "dcba hgfe"
        XCTAssertEqual(expectedString, sut.reverse(phrase: input, ignoredCharacters: ignoredCharacters))
        
        input = "a1bcd efglh"
        expectedString = "dcb1a hgfle"
        XCTAssertEqual(expectedString, sut.reverse(phrase: input, ignoredCharacters: ignoredCharacters))
    }
}
