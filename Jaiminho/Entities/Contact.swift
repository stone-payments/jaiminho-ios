//
//  Contact.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 17/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

public struct Contact {
    public var address: String
    public var name: String?
    
    
    public init(address: String, name: String? = nil) {
        self.address = address
        self.name = name
    }
}
