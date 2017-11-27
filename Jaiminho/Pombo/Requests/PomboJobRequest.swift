//
//  PomboJobRequest.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 14/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit
import Packer

public struct PomboJobRequest: APIRequest {

    public typealias Response = PomboJobResponse
    
    public var resourceName: String {
        return "jobs/\(trackId)"
    }
    
    private let trackId: String
    
    public init(trackId: String) {
        self.trackId = trackId
    }
}
