//
//  Email.swift
//  PomboMailSDK
//
//  Created by Jaison Vieira on 09/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

struct PomboEmailRequest: APIRequest {
    
    public typealias Response = PomboEmailResponse
    
    public var resourceName: String {
        return "emails"
    }
    
    var company: String
    var costCenter: String
    var messages: [Message]

    init(company: String, costCenter: String, messages: [Message]) {
        self.company = company
        self.costCenter = costCenter
        self.messages = messages
    }
}

struct Message: Encodable {
    
    enum Structure: Int, Codable {
        case commercial = 1
        case transactional = 2
    }
    
    var from: Contact
    var to: [Contact]
    var sendStructure: Structure?
    var subject: String?
    var body: String?
    
    var cc: [Contact]?
    var bcc: [Contact]?
    var templateId: String?
    var sendAt: Date?
    
    init(from: Contact, to: [Contact], sendStructure: Structure, subject: String, body: String) {
        self.from = from
        self.to = to
        self.sendStructure = sendStructure
        self.subject = subject
        self.body = body
    }
}

struct Contact: Encodable {
    
    var name: String?
    var address: String
    var subscriberKey: String?
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
    init(address: String, subscriberKey: String) {
        self.address = address
        self.subscriberKey = subscriberKey
    }
    
}
