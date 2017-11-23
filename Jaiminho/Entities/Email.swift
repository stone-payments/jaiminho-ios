//
//  EmailSender.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

@objc public class Email: NSObject {
    var from: Contact
    var to: [Contact]
    var cc: [Contact]?
    var bcc: [Contact]?
    var body: String
    var subject: String
    
    init(from: Contact, to: [Contact], cc: [Contact]?, bcc: [Contact]?, body: String, subject: String) {
        self.from = from
        self.to = to
        self.cc = cc
        self.bcc = bcc
        self.body = body
        self.subject = subject
    }
}


