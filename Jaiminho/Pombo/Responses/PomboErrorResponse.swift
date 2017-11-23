//
//  ErrorResponse.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboErrorResponse: NSObject, Decodable {
    var errors: [String]
    var message: String
    var success: Bool
    
    init(errors: [String], message: String, success: Bool) {
        self.errors = errors
        self.message = message
        self.success = success
    }
}
