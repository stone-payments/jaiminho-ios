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

struct PomboJobResponse: Decodable {
    var content: JobObject
    var success: Bool
}

struct JobObject: Decodable {
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
    
//    enum CodingKeys: String, CodingKey {
//        case identifier,company,status,message,messageId,notificationType,subtasks,startAt,lastUpdatedAt,tokenId
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        identifier = try values.decode(String.self, forKey: .identifier)
//        company = try values.decode(String.self, forKey: .identifier)
//        status = try values.decode(JobStatus.self, forKey: .status)
//        message = try values.decode(String.self, forKey: .message)
//        messageId = try values.decode(String.self, forKey: .messageId)
//        notificationType = try values.decode(JobNotificationType.self, forKey: .notificationType)
//        subtasks = try values.decode([JobObject].self, forKey: .subtasks)
//        startAt = try values.decode(Double.self, forKey: .startAt)
//        lastUpdatedAt = try values.decode(Double.self, forKey: .lastUpdatedAt)
//        tokenId = try values.decode(String.self, forKey: .tokenId)
//    }
}
