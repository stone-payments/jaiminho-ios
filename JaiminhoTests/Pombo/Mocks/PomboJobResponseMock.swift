//
//  PomboJobResponseMock.swift
//  JaiminhoTests
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboJobResponseMock {
    class var json: Data {
        let dic: [String : Any] = [
            "content": [
                "identifier": "NWI4NGFlZTktMDBhYi00MTVhLWEwNWMtNDk5NjA0OTFjMzc1",
                "company": "Stone",
                "status": "Finished",
                "message": "The batch of email was successfully sent.",
                "messageId": "",
                "notificationType": "Email",
                "subtasks": [
                    [
                        "identifier": "ODU3NDk2MzI1VHVlIE5vdiAxNCAxNjo1NjoyNiBVVEMgMjAxNy0yMDE4NTE4NDk3",
                        "company": "Stone",
                        "status": "Finished",
                        "message": "The batch of email was successfully sent.",
                        "messageId": "",
                        "notificationType": "Email",
                        "subtasks": [
                            [
                                "identifier": "LTYxOTQ3MDM3VHVlIE5vdiAxNCAxNjo1NjoyNiBVVEMgMjAxNy0xNjIwNTY0OTY1",
                                "company": "Stone",
                                "status": "Finished",
                                "message": "The email was successfully sent.",
                                "messageId": "Stone-com",
                                "notificationType": "Email",
                                "subtasks": [],
                                "startAt": 1510678586902,
                                "lastUpdatedAt": 1510678594898,
                                "tokenId": "ea9a2e1d-b90f-4abe-b778-c7a713a22779"
                            ]
                        ],
                        "startAt": 1510678586593,
                        "lastUpdatedAt": 1510678594857,
                        "tokenId": ""
                    ]
                ],
                "startAt": 1510678586593,
                "lastUpdatedAt": 1510678594751,
                "tokenId": ""
            ],
            "success": true
        ]
        do {
            return try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
