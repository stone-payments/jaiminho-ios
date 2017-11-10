//
//  APIError.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case encoding
    case decoding
    case server(errors: [String], message: String?)
}
