//
//  PomboEmailResponseMock.swift
//  JaiminhoTests
//
//  Created by Jaison Vieira on 10/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboEmailResponseMock {

    class var json: Data {
        let dic: [String : Any] = [
            "trackId": "OTI4YTZhNjctMDVjNi00NmE0LWFjNDMtMDM0MzI0YWRjZDJh",
            "message": "Your request is being processed.",
            "success": true]
        do {
            return try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
