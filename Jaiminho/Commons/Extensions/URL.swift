//
//  URL.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

extension URL {
    func appendingQueryString(_ queryString: String) -> URL {
        if !queryString.isEmpty {
            let delimiter = (query == nil ? "?" : "&")
            let urlString = "\(absoluteString)\(delimiter)\(queryString)"
            if let url = URL(string: urlString) {
                return url
            }
        }
        return self
    }
}
