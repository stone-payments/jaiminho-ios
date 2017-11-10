//
//  Encodable.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

extension Encodable {
    func queryStringValue() throws -> String {
        let parametersData = try JSONEncoder().encode(self)
        
        let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
        
        return parameters.map({ "\($0)=\($1)" })
                         .joined(separator: "&")
                         .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
    func dataValue() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
