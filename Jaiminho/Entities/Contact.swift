//
//  Contact.swift
//  Jaiminho
//
//  Created by Jaison Vieira on 17/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

@objc public class Contact: NSObject {
    @objc public var address: String
    @objc public var name: String?
    
    
    @objc public init(address: String, name: String?) {
        self.address = address
        self.name = name
    }
}
