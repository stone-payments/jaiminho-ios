//
//  PomboResponse.swift
//  PomboMail
//
//  Created by Jaison Vieira on 25/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public struct PomboEmailResponse: Decodable {
    public var trackId: String
    public var success: Bool
    public var message: String

    init(trackId: String, success: Bool, message: String) {
        self.trackId = trackId
        self.success = success
        self.message = message
    }
}
