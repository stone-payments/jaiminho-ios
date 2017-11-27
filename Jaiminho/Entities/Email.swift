//
//  EmailSender.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public struct Email {
    
    /// Who is sending the email.
    public var from: Contact
    /// An array containing the contacts that will receive the email as "To".
    public var to: [Contact]
    /// An array containing the contacts that will receive the email as "Cc".
    public var cc: [Contact]?
    /// An array containing the contacts that will receive the email as "Bcc".
    public var bcc: [Contact]?
    /// The email body message.
    public var body: String
    /// The subject field.
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


