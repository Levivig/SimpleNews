//
//  RestClient.swift
//  Template
//
//  Created by Levente Vig on 2019. 09. 21..
//  Copyright © 2019. levivig. All rights reserved.
//

import Alamofire
import Foundation

class RestClient {
    
    // MARK: Singleton
    static let shared = RestClient()
    private init() {}
    
    // MARK: - Private properties -
    
    private var headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    // MARK: - Requests -
    
    internal func request<T: Codable>(url: String,
                                      method: HTTPMethod = .get,
                                      data: [String: Any]? = nil,
                                      completion: ((Result<T, Error>) -> Void)?) {

        AF.request(url,
                   method: method,
                   parameters: data,
                   encoding: JSONEncoding.default,
                   headers: self.headers)
            .responseData { (response: DataResponse<Data, AFError>) in
                
                log.debug(response.debugDescription)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                decoder.dateDecodingStrategy = .iso8601
                
                switch response.result {
                case .success(let data):
                    if let object = try? decoder.decode(T.self, from: data) {
                        log.debug("success: \(String(describing: response.request?.url))")
                        completion?(Result.success(object))
                    } else if let error = try? decoder.decode(APIError.self, from: data) {
                        log.warning("\(error)")
                        completion?(Result.failure(error))
                    }
                case .failure(let error):
                    if let data = response.data,let apiError = try? decoder.decode(APIError.self, from: data) {
                        log.warning("\(apiError)")
                        completion?(Result.failure(apiError))
                    } else {
                        log.warning("\(error)")
                        completion?(Result.failure(error))
                    }
                }
        }
    }
}
