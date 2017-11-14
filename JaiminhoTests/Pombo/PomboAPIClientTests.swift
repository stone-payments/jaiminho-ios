//
//  EmailControllerTest.swift
//  PomboMailSDKTests
//
//  Created by Jaison Vieira on 10/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import XCTest
@testable import Jaiminho

class PomboAPIClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSendEmail() {
        let expect = expectation(description: "Pass")

        let pomboClient = PomboAPIClient(apiToken: "t2NAXxmDB6SjeLEvCgdAwNe2c7l9FD")
        pomboClient.send(PomboEmailRequestMock.object, method: .post) { response in
            switch response {
            case .success(_):
                expect.fulfill()
                assert(true)
            case .failure(let error):
                XCTFail("Sending email error: \(error)")
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }

    func testGetJob() {
        let expect = expectation(description: "Pass")
        
        let pomboClient = PomboAPIClient(apiToken: "t2NAXxmDB6SjeLEvCgdAwNe2c7l9FD")
        pomboClient.send(PomboJobRequest(trackId: "NWI4NGFlZTktMDBhYi00MTVhLWEwNWMtNDk5NjA0OTFjMzc1"), method: .get) { response in
            switch response {
            case .success(_):
                expect.fulfill()
                assert(true)
            case .failure(let error):
                XCTFail("Sending email error: \(error)")
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
}
