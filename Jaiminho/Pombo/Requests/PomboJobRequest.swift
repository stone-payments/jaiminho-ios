//
//  PomboJobRequest.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

class PomboJobRequest: NSObject, APIRequest {

    public typealias Response = PomboJobResponse
    
    public var resourceName: String {
        return "jobs/\(trackId)"
    }
    
    // Parameters
    private let trackId: String
    
    init(trackId: String) {
        self.trackId = trackId
    }
}
