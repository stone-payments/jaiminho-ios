//
//  PomboJobResponse.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

/// Job Status
///
/// - running: The task is still being processed.
/// - degraded: The task expired due inner task failure.
/// - failed: The task failed for some reason (ex.: Could not communicate to underlying messenger).
/// - finished: The task ran to completion.
/// - duplicated: The task was mark as duplicated and dropped.
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
    /// The Job identifier.
    public var identifier: String
    /// The company who owns that job
    public var company: String
    /// The current status of the job.
    public var status: JobStatus
    /// A description of the status.
    public var message: String
    /// The message template Identifier on the underlying messenger.
    public var messageId: String
    /// The type of the notification used by the job.
    public var notificationType: JobNotificationType
    /// A list of attached subtasks on the job.
    public var subtasks: [JobObject]
    var startAt: Double
    var lastUpdatedAt: Double
    public var tokenId: String
    
    /// When the task was started.
    public var startAtDate: Date {
        return Date(timeIntervalSince1970: startAt/1000)
    }
    /// When the task was ended.
    public var lastUpdatedAtDate: Date {
        return Date(timeIntervalSince1970: lastUpdatedAt/1000)
    }
}

