//
//  PomboErrorResponseMock.swift
//  JaiminhoTests
//
//  Created by Jaison Vieira on 10/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboErrorResponseMock {

    class var json: Data {
        let dic: [String : Any] = [
            "errors": ["Some random error occurred."],
            "message": "We were unable describes validate part of your request.",
            "success": false]
        do {
            return try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
