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
    
    
    /// API Endpoint
    public var resourceName: String {
        return "emails"
    }
    
    /// Company to which the application belongs.
    var company: String
    /// Cost center to which the application belongs.
    var costCenter: String
    /// Array of email-message objects.
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
    /// From address. If no value is set, the default From address will be used.
    var from: PomboContact
    /// To address. Array of PomboContact.
    var to: [PomboContact]
    /// Defines send structure. Can be used commercial or transactional.
    var sendStructure: Structure?
    /// Email subject.
    var subject: String?
    /// Email body.
    var body: String?
    
    /// Carbon copy. Array of PomboContact.
    var cc: [PomboContact]?
    /// Blind carbon copy. Array of PomboContact.
    var bcc: [PomboContact]?
    /// Email template. If used, there is no need to specify subject, body, sendStructure.
    var templateId: String?
    /// Email scheduling date. If no value is set, the mail will be sent automatically.
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
    
    /// Contact name.
    var name: String?
    /// Contact email address.
    var address: String
    /// Subscriber key (Key of the contact on the underlying CRM).
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
