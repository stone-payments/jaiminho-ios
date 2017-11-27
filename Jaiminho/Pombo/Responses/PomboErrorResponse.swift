//
//  ErrorResponse.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public struct PomboErrorResponse: Decodable {
    
    /// Error list.
    public var errors: [String]
    /// Message from API.
    public var message: String
    /// Response success.
    public var success: Bool
    
    init(errors: [String], message: String, success: Bool) {
        self.errors = errors
        self.message = message
        self.success = success
    }
}
