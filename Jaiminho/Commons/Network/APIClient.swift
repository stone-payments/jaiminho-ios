//
//  APIClient.swift
//  PomboMail
//
//  Created by Jaison Vieira on 10/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol APIClient {

    var session: URLSession { get set }
    var dataTask: URLSessionDataTask? { get set }
    var baseUrl: String { get set }
    var headers: [String:String] { get set }
    
    func send<T: APIRequest>(_ request: T, method: HTTPMethod, completion: @escaping ResultCallback<T.Response>)
    func cancel()
}

extension APIClient {
    func cancel() {
        dataTask?.cancel()
    }
}
