//
//  PomboJobResponse.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public enum JobStatus: String, Decodable {
    case running = "Running"
    case degraded = "Degraded"
    case failed = "Failed"
    case finished = "Finished"
    case duplicated = "Duplicated"
}

public enum JobNotificationType: String, Decodable {
    case email = "Email"
    case push = "Push"
    case sms = "Sms"
}

public struct PomboJobResponse: Decodable {
    public var content: JobObject
    public var success: Bool
    
    init(content: JobObject, success: Bool) {
        self.content = content
        self.success = success
    }
}

public struct JobObject: Decodable {
    public var identifier: String
    public var company: String
    public var status: JobStatus
    public var message: String
    public var messageId: String
    public var notificationType: JobNotificationType
    public var subtasks: [JobObject]
    var startAt: Double
    var lastUpdatedAt: Double
    public var tokenId: String
    
    public var startAtDate: Date {
        return Date(timeIntervalSince1970: startAt/1000)
    }
    public var lastUpdatedAtDate: Date {
        return Date(timeIntervalSince1970: lastUpdatedAt/1000)
    }
}

