//
//  PomboErrorResponseTests.swift
//  JaiminhoTests
//
//  Created by Jaison Vieira on 10/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import XCTest
@testable import Jaiminho

class PomboErrorResponseTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParseJSON() {
        let decoder = JSONDecoder()
        do {
            let responseData = PomboErrorResponseMock.json
            
            let response = try decoder.decode(PomboErrorResponse.self, from: responseData)
            
            XCTAssertEqual(response.errors, ["Some random error occurred."])
            XCTAssertEqual(response.success, false)
            XCTAssertEqual(response.message, "We were unable describes validate part of your request.")
        }
        catch {
            XCTFail("Failled deserializing JSON.")
        }
    }
    
    func testParseJSONWithIncorrectData() {
        let decoder = JSONDecoder()
        do {
            let responseData = Data()
            
            let email = try decoder.decode(PomboErrorResponse.self, from: responseData)
            XCTAssertNil(email)
        }
        catch DecodingError.dataCorrupted {
            assert(true)
        }
        catch {
            XCTFail("Failled. Deserializing should not work with incorrect JSON. \(error)")
        }
    }
}
