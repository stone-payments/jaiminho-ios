//
//  PomboResponse.swift
//  PomboMail
//
//  Created by Jaison Vieira on 25/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboEmailResponse: NSObject, Decodable {
    var trackId: String
    var success: Bool
    var message: String

    init(trackId: String, success: Bool, message: String) {
        self.trackId = trackId
        self.success = success
        self.message = message
    }
}
