//
//  Email.swift
//  PomboMailSDK
//
//  Created by Jaison Vieira on 09/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit
import Packer

public enum Structure: Int, Codable {
    case commercial = 1
    case transactional = 2
}

public struct PomboEmailRequest: APIRequest {
    
    public typealias Response = PomboEmailResponse
    
    public var resourceName: String {
        return "emails"
    }
    
    var company: String
    var costCenter: String
    var messages: [PomboMessage]

    internal init(company: String, costCenter: String, messages: [PomboMessage]) {
        self.company = company
        self.costCenter = costCenter
        self.messages = messages
    }
    
    public init(email: Email, company: String, costCenter: String, structure: Structure) {
        self.company = company
        self.costCenter = costCenter
        
        var recipients = [PomboContact]()
        for recipient in email.to {
            recipients.append(PomboContact(address: recipient.address, subscriberKey: recipient.address))
        }
        let sender = PomboContact(name: email.from.name, address: email.from.address)
        self.messages = [PomboMessage(from: sender, to: recipients, sendStructure: structure, subject: email.subject, body: email.body)]
    }
}

struct PomboMessage: Encodable {
    var from: PomboContact
    var to: [PomboContact]
    var sendStructure: Structure?
    var subject: String?
    var body: String?
    
    var cc: [PomboContact]?
    var bcc: [PomboContact]?
    var templateId: String?
    var sendAt: Date?
    
    init(from: PomboContact, to: [PomboContact], sendStructure: Structure, subject: String, body: String) {
        self.from = from
        self.to = to
        self.sendStructure = sendStructure
        self.subject = subject
        self.body = body
    }
}

struct PomboContact: Encodable {
    
    var name: String?
    var address: String
    var subscriberKey: String?
    
    init(name: String?, address: String) {
        self.name = name
        self.address = address
    }
    
    init(address: String, subscriberKey: String) {
        self.address = address
        self.subscriberKey = subscriberKey
    }
    
}
