//
//  EmailMock.swift
//  PomboMailTests
//
//  Created by Jaison Vieira on 20/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit
@testable import Jaiminho

class PomboEmailRequestMock {

    class var object: PomboEmailRequest {
        let recipient = Contact(address: "jvieira@stone.com.br", subscriberKey: "123456")
        let sender = Contact(name: "Stone", address: "noreply@stone.com.br")
        
        let message = Message(from: sender, to: [recipient], sendStructure: .commercial, subject: "Subject", body: "Message")
        
        return PomboEmailRequest(company: "Stone", costCenter: "1234", messages: [message])
    }
    
    class var json: Data {
        let dic: [String : Any] = [
            "company":"Stone",
            "costCenter":"1234",
            "messages":[
                ["body":"Message",
                 "to":[["subscriberKey":"123456",
                        "address":"jvieira@stone.com.br"]],
                 "subject":"Subject",
                 "sendStructure":1,
                 "from":["address":"noreply@stone.com.br",
                         "name":"Stone"]]]]
        do {
            return try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
