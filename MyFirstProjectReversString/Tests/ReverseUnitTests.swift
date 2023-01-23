//
//  ReverseUnitTests.swift
//  MyFirstProjectMyFirstProjectReversStringTests
//
//  Created by Konstantyn Koroban on 03/11/2022.
//

import XCTest

final class ReverseUnitTests: XCTestCase {
    
        var sut: ReversePhrase!
        
        override func setUp() {
            sut = ReversePhrase()
        }
        
        override func tearDown() {
            sut = nil
        }
        
        func test_ReversePhrase_emptyString() {
            XCTAssert(sut.reverse(phrase: "").isEmpty)
        }
        
        func test_reversePhrase_emptyString_emptyExclusion() {
            XCTAssert(sut.reverse(phrase: "", ignoredCharacters: "").isEmpty)
        }
        
        func test_ReversePhrase_defaultExclusion() {
            var string = "abcd efgh"
            var expectedString = "dcba hgfe"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string))
            
            string = "a1bcd efg!h"
            expectedString = "d1cba hgf!e"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string))
        }
        
        func test_reversePhrase_singleWordString() {
            let string = "Avcd"
            let expectedString = "dcvA"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string))
        }
        
        func test_reversePhrase_string_emptyExclusion() {
            let string = "a1bcd efg!h"
            let ignoredCharacters = ""
            let expectedString = "dcb1a h!gfe"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string, ignoredCharacters: ignoredCharacters))
        }
        
        func test_reversePhrase_string_customExclusion() {
            let string = "Batman cool 24/7"
            let ignoredCharacters = "Batman"
            let expectedString = "Batman looc 7/42"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string, ignoredCharacters: ignoredCharacters))
        }
        
        func test_reversePhrase_emptyString_customExclusion() {
            XCTAssert(sut.reverse(phrase: "", ignoredCharacters: "123").isEmpty)
        }
        
        func test_reversePhrase_string_customExclusion_letters() {
            let ignoredCharacters = "xl"
            var string = "Batman cool 24/7"
            var expectedString = "namtaB oocl 7/42"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string, ignoredCharacters: ignoredCharacters))
            
            string = "abcd efgh"
            expectedString = "dcba hgfe"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string, ignoredCharacters: ignoredCharacters))
            
            string = "a1bcd efglh"
            expectedString = "dcb1a hgfle"
            XCTAssertEqual(expectedString, sut.reverse(phrase: string, ignoredCharacters: ignoredCharacters))
        }
    }

