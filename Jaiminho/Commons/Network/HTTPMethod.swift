//
//  HTTPMethod.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
    func urlRequest<T:APIRequest>(urlString: String, request: T? = nil, headers: [String: String]? = nil) throws -> URLRequest {
        let URLRequestInfo: (url: URL, HTTPBody: Data?) = try {
            let url = URL(string: "\(urlString)\(request?.resourceName ?? "")")!
            if let parameters = request {
                if self == .get {
                    return (url: url.appendingQueryString(try parameters.queryStringValue()), HTTPBody: nil)
                }
                return (url: url, HTTPBody: try parameters.dataValue())
            }
            return (url: url, HTTPBody: nil)
        }()
        
        var request = URLRequest(url: URLRequestInfo.url)
        request.httpBody = URLRequestInfo.HTTPBody
        request.httpMethod = rawValue
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
