//
//  PomboResponse.swift
//  PomboMail
//
//  Created by Jaison Vieira on 25/10/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboEmailResponse: Decodable {

    var trackId: String
    var success: Bool
    var message: String

}
