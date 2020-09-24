//
//  URLParameterEncoding.swift
//  SwiftFeedly
//
//  Created by Anton Simakov on 4/30/20.
//  Copyright © 2020 Anton Simakov. All rights reserved.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    public func encode(URLRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let URL = URLRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: URL,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {
            
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key,
                                             value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            URLRequest.url = urlComponents.url
        }
        
        if URLRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            URLRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        
    }
}
