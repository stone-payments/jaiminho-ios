//
//  EmailTest.swift
//  PomboMailSDKTests
//
//  Created by Jaison Vieira on 09/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import XCTest
@testable import Jaiminho

class PomboEmailRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()        
    }
    
    func testSerilaizeJSON() {
        let encoder = JSONEncoder()
        do {
            let emailData = try encoder.encode(PomboEmailRequestMock.object)
            
            let json = try JSONSerialization.jsonObject(with: emailData, options: [])
            
            if let emailDict = json as? [String:Any],
            let messagesArray = emailDict["messages"] as? [Any],
            let messagesDict = messagesArray[0] as? [String:Any],
            let toArray = messagesDict["to"] as? [Any],
            let toDict = toArray[0] as? [String:String],
            let fromDict = messagesDict["from"] as? [String:String] {
                XCTAssertEqual(emailDict["company"] as? String, "Stone")
                XCTAssertEqual(emailDict["costCenter"] as? String, "1234")
                XCTAssertEqual(messagesDict["body"] as? String, "Message")
                XCTAssertEqual(messagesDict["subject"] as? String, "Subject")
                XCTAssertEqual(messagesDict["sendStructure"] as? Int, 1)
                XCTAssertEqual(toDict["subscriberKey"], "123456")
                XCTAssertEqual(toDict["address"], "jvieira@stone.com.br")
                XCTAssertEqual(fromDict["name"], "Stone")
                XCTAssertEqual(fromDict["address"], "noreply@stone.com.br")
            }
            else {
                XCTFail("Failled getting dictionary elements.")
            }
        }
        catch {
            XCTFail("Failled serializing to JSON.")
        }
    }
    
    func testSerilaizeJSONFromEmail() {
        let to = Contact(address: "jvieira@stone.com.br", name: nil)
        let from = Contact(address: "noreply@stone.com.br", name: "Stone")
        let email = Email(from: from, to: [to], cc: nil, bcc: nil, body: "Message", subject: "Subject")
        
        let encoder = JSONEncoder()
        do {
            let emailData = try encoder.encode(PomboEmailRequest(email: email, company: "Stone", costCenter: "1234", structure: .commercial))
            
            let json = try JSONSerialization.jsonObject(with: emailData, options: [])
            
            if let emailDict = json as? [String:Any],
                let messagesArray = emailDict["messages"] as? [Any],
                let messagesDict = messagesArray[0] as? [String:Any],
                let toArray = messagesDict["to"] as? [Any],
                let toDict = toArray[0] as? [String:String],
                let fromDict = messagesDict["from"] as? [String:String] {
                XCTAssertEqual(emailDict["company"] as? String, "Stone")
                XCTAssertEqual(emailDict["costCenter"] as? String, "1234")
                XCTAssertEqual(messagesDict["body"] as? String, "Message")
                XCTAssertEqual(messagesDict["subject"] as? String, "Subject")
                XCTAssertEqual(messagesDict["sendStructure"] as? Int, 1)
                XCTAssertEqual(toDict["subscriberKey"], "jvieira@stone.com.br")
                XCTAssertEqual(toDict["address"], "jvieira@stone.com.br")
                XCTAssertEqual(fromDict["name"], "Stone")
                XCTAssertEqual(fromDict["address"], "noreply@stone.com.br")
            }
            else {
                XCTFail("Failled getting dictionary elements.")
            }
        }
        catch {
            XCTFail("Failled serializing to JSON.")
        }
    }
}
