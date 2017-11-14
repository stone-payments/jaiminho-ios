//
//  PomboJobResponseTests.swift
//  JaiminhoTests
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import XCTest
@testable import Jaiminho

class PomboJobResponseTests: XCTestCase {

    func testParseJSON() {
        let decoder = JSONDecoder()
        do {
            let responseData = PomboJobResponseMock.json
            
            let response = try decoder.decode(PomboJobResponse.self, from: responseData)
            
            XCTAssertEqual(response.content.identifier, "NWI4NGFlZTktMDBhYi00MTVhLWEwNWMtNDk5NjA0OTFjMzc1")
            XCTAssertEqual(response.content.company, "Stone")
            XCTAssertEqual(response.content.status, .finished)
            XCTAssertEqual(response.content.message, "The batch of email was successfully sent.")
            XCTAssertEqual(response.content.messageId, "")
            XCTAssertEqual(response.content.notificationType, .email)
            XCTAssertEqual(response.content.startAtDate, Date(timeIntervalSince1970: 1510678586593/1000))
            XCTAssertEqual(response.content.lastUpdatedAtDate,  Date(timeIntervalSince1970: 1510678594751/1000))
            XCTAssertEqual(response.content.tokenId, "")
            XCTAssertEqual(response.success, true)
            XCTAssertEqual(response.content.subtasks[0].identifier, "ODU3NDk2MzI1VHVlIE5vdiAxNCAxNjo1NjoyNiBVVEMgMjAxNy0yMDE4NTE4NDk3")
            XCTAssertEqual(response.content.subtasks[0].company, "Stone")
            XCTAssertEqual(response.content.subtasks[0].status, .finished)
            XCTAssertEqual(response.content.subtasks[0].message, "The batch of email was successfully sent.")
            XCTAssertEqual(response.content.subtasks[0].messageId, "")
            XCTAssertEqual(response.content.subtasks[0].notificationType, .email)
            XCTAssertEqual(response.content.subtasks[0].startAtDate, Date(timeIntervalSince1970: 1510678586593/1000))
            XCTAssertEqual(response.content.subtasks[0].lastUpdatedAtDate, Date(timeIntervalSince1970: 1510678594857/1000))
            XCTAssertEqual(response.content.subtasks[0].tokenId, "")
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].identifier, "LTYxOTQ3MDM3VHVlIE5vdiAxNCAxNjo1NjoyNiBVVEMgMjAxNy0xNjIwNTY0OTY1")
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].company, "Stone")
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].status, .finished)
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].message, "The email was successfully sent.")
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].messageId, "Stone-com")
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].notificationType, .email)
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].startAtDate, Date(timeIntervalSince1970: 1510678586902/1000))
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].lastUpdatedAtDate, Date(timeIntervalSince1970: 1510678594898/1000))
            XCTAssertEqual(response.content.subtasks[0].subtasks[0].tokenId, "ea9a2e1d-b90f-4abe-b778-c7a713a22779")
        }
        catch {
            XCTFail("Failled deserializing JSON. \(error)")
        }
    }
    
    func testParseJSONWithIncorrectData() {
        let decoder = JSONDecoder()
        do {
            let responseData = Data()
            
            let email = try decoder.decode(PomboJobResponse.self, from: responseData)
            XCTAssertNil(email)
        }
        catch {}
    }
}
