//
//  PomboAPIClient.swift
//  PomboMail
//
//  Created by Jaison Vieira on 09/11/17.
//  Copyright © 2017 Stone Pagamentos. All rights reserved.
//

import Foundation
import Packer

/// The API client for the Pombo Correio API
public class PomboCorreio: APIClient {

    private var apiToken: String
    public var session = URLSession(configuration: .default)
    public var dataTask: URLSessionDataTask?
    public var headers: [String:String]?

    public var baseUrl: String {
        switch Configuration.environment {
        case .develop:
            return "http://pombo-correio-api-dev.paas.dev.dc2.buy4.io/v1/"
        case .production:
            return "https://pombo-correio-api.stone.com.br/v1/"
        }
    }
    
    
    public init(apiToken: String) {
        self.apiToken = apiToken
        headers = ["Accept":"application/json",
                   "Content-Type":"application/json",
                   "Authorization":"Shared \(apiToken)"]
    }
    
    /// Method responsible for sending the Pombo Correio API requests
    ///
    /// - Parameters:
    ///   - request: The request struct to be sent
    ///   - method: HTTP method to send the request
    ///   - completion: Result can be .failure or .success. The failure will contain the PomboErrorResponse and the success will have the reponse conresponding to the request.
    public func send<T: APIRequest>(_ request: T, method: HTTPMethod, completion: @escaping ResultCallback<T.Response>) {
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

