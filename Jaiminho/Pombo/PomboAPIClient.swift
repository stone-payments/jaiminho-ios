//
//  PomboAPIClient.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import Foundation

class PomboAPIClient: APIClient {

    var apiToken: String
    internal var session = URLSession(configuration: .default)
    internal var dataTask: URLSessionDataTask?
    internal var baseUrl = "https://pombo-correio-api.stone.com.br/v1/"
    internal var headers: [String:String]
    
    init(apiToken: String) {
        self.apiToken = apiToken
        headers = ["Accept":"application/json",
                   "Content-Type":"application/json",
                   "Authorization":"Shared \(apiToken)"]
    }
    
    func send<T: APIRequest>(_ request: T, method: HTTPMethod, completion: @escaping ResultCallback<T.Response>) {
        do {
            let urlRequest = try method.urlRequest(urlString: baseUrl, request: request, headers: headers)
            dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let data = data {
                    do {
                        if let response = response as? HTTPURLResponse,
                            (200...299).contains(response.statusCode) {
                            
                            let objectResponse = try JSONDecoder().decode(T.Response.self, from: data)
                            completion(.success(objectResponse))
                        }
                        else {
                            let errorResponse = try JSONDecoder().decode(PomboErrorResponse.self, from: data)
                            completion(.failure(APIError.server(errors: errorResponse.errors, message: errorResponse.message)))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
                else if let error = error {
                    completion(.failure(error))
                }
                else {
                    completion(.failure(APIError.server(errors: ["Erro"], message: nil)))
                }
            }
            dataTask?.resume()
        }
        catch {
            completion(.failure(error))
        }
    }
}

