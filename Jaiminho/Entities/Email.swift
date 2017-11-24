//
//  EmailSender.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public struct Email {
    public var from: Contact
    public var to: [Contact]
    public var cc: [Contact]?
    public var bcc: [Contact]?
    public var body: String
    public var subject: String
    
    public init(from: Contact, to: [Contact], cc: [Contact]? = nil, bcc: [Contact]? = nil, body: String, subject: String) {
        self.from = from
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.body = body
        self.subject = subject
    }
}


