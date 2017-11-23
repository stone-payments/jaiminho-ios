//
//  PomboJobResponse.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

enum JobStatus: String, Decodable {
    case running = "Running"
    case degraded = "Degraded"
    case failed = "Failed"
    case finished = "Finished"
    case duplicated = "Duplicated"
}

enum JobNotificationType: String, Decodable {
    case email = "Email"
    case push = "Push"
    case sms = "Sms"
}

class PomboJobResponse: NSObject, Decodable {
    var content: JobObject
    var success: Bool
    
    init(content: JobObject, success: Bool) {
        self.content = content
        self.success = success
    }
}

class JobObject: NSObject, Decodable {
    var identifier: String
    var company: String
    var status: JobStatus
    var message: String
    var messageId: String
    var notificationType: JobNotificationType
    var subtasks: [JobObject]
    var startAt: Double
    var lastUpdatedAt: Double
    var tokenId: String
    
    var startAtDate: Date {
        return Date(timeIntervalSince1970: startAt/1000)
    }
    var lastUpdatedAtDate: Date {
        return Date(timeIntervalSince1970: lastUpdatedAt/1000)
    }
    
    init(identifier: String, company: String, status: JobStatus, message: String,
         messageId: String, notificationType: JobNotificationType,
         subtasks: [JobObject], startAt: Double, lastUpdatedAt: Double, tokenId: String) {
        self.identifier = identifier
        self.company = company
        self.status = status
        self.message = message
        self.messageId = messageId
        self.notificationType = notificationType
        self.subtasks = subtasks
        self.startAt = startAt
        self.lastUpdatedAt = lastUpdatedAt
        self.tokenId = tokenId
    }
}

