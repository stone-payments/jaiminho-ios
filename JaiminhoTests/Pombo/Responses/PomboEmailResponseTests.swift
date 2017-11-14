//
//  PomboEmailResponseTests.swift
//  JaiminhoTests
//
//  Created by Jaison Vieira on 10/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import XCTest
@testable import Jaiminho

class PomboEmailResponseTests: XCTestCase {
        
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
            let responseData = PomboEmailResponseMock.json
            
            let response = try decoder.decode(PomboEmailResponse.self, from: responseData)
            
            XCTAssertEqual(response.trackId, "OTI4YTZhNjctMDVjNi00NmE0LWFjNDMtMDM0MzI0YWRjZDJh")
            XCTAssertEqual(response.success, true)
            XCTAssertEqual(response.message, "Your request is being processed.")
        }
        catch {
            XCTFail("Failled deserializing JSON.")
        }
    }
    
    func testParseJSONWithIncorrectData() {
        let decoder = JSONDecoder()
        do {
            let responseData = Data()
            
            let email = try decoder.decode(PomboEmailResponse.self, from: responseData)
            XCTAssertNil(email)
        }
        catch {}
    }
}
