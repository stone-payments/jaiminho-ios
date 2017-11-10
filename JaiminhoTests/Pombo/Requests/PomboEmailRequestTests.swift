//
//  EmailTest.swift
//  PomboMailSDKTests
//
//  Created by Jaison Vieira on 09/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import XCTest
@testable import Jaiminho

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

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
            let emailData = try encoder.encode(PomboEmailRequestMock.emailObject)
            
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

//    func testParseJSON() {
//        let decoder = JSONDecoder()
//        do {
//            let emailData = EmailMock.emailJSON
//
//            let email = try decoder.decode(Email.self, from: emailData)
//            let message = email.messages[0]
//            let to = message.to[0]
//            let from = message.from
//
//            XCTAssertEqual(email.company, "Stone")
//            XCTAssertEqual(email.costCenter, "1234")
//            XCTAssertEqual(message.body, "Message")
//            XCTAssertEqual(message.subject, "Subject")
//            XCTAssertEqual(message.sendStructure, Message.Structure.commercial)
//            XCTAssertEqual(to.address, "jvieira@stone.com.br")
//            XCTAssertEqual(to.subscriberKey, "123456")
//            XCTAssertEqual(to.address, "jvieira@stone.com.br")
//            XCTAssertEqual(from.address, "noreply@stone.com.br")
//        }
//        catch {
//            XCTFail("Failled deserializing JSON.")
//        }
//    }
    
//    func testParseJSONWithIncorrectData() {
//        let decoder = JSONDecoder()
//        do {
//            let emailData = Data()
//
//            let email = try decoder.decode(Email.self, from: emailData)
//            XCTAssertNil(email)
//        }
//        catch {}
//    }
    
//    func testPostEmail() {
//        let decoder = JSONDecoder()
//        do {
//            let emailData1 = EmailMock.emailJSON
//            
//            let email = try decoder.decode(Email.self, from: emailData1)
//            
//            let emailRequest = PostEmail(request: email)
//            
//            let encoder = JSONEncoder()
//            let emailData = try encoder.encode(emailRequest)
//            let json = try JSONSerialization.jsonObject(with: emailData, options: [])
//            
//            if let emailDict = json as? [String:Any],
//                let messagesArray = emailDict["messages"] as? [Any],
//                let messagesDict = messagesArray[0] as? [String:Any],
//                let toArray = messagesDict["to"] as? [Any],
//                let toDict = toArray[0] as? [String:String],
//                let fromDict = messagesDict["from"] as? [String:String] {
//                XCTAssertEqual(emailDict["company"] as? String, "Stone")
//                XCTAssertEqual(emailDict["costCenter"] as? String, "1234")
//                XCTAssertEqual(messagesDict["body"] as? String, "Message")
//                XCTAssertEqual(messagesDict["subject"] as? String, "Subject")
//                XCTAssertEqual(messagesDict["sendStructure"] as? Int, 1)
//                XCTAssertEqual(toDict["subscriberKey"], "123456")
//                XCTAssertEqual(toDict["address"], "jvieira@stone.com.br")
//                XCTAssertEqual(fromDict["name"], "Stone")
//                XCTAssertEqual(fromDict["address"], "noreply@stone.com.br")
//            }
//            else {
//                XCTFail("Failled getting dictionary elements.")
//            }
//            
//        }
//        catch {
//            XCTFail("Failled deserializing JSON.")
//        }
//    }
}
