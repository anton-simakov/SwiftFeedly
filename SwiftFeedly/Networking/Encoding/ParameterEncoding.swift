//
//  ParameterEncoding.swift
//  SwiftFeedly
//
//  Created by Anton Simakov on 4/30/20.
//  Copyright © 2020 Anton Simakov. All rights reserved.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    func encode(URLRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum ParameterEncoding {
    
    case URLEncoding
    case JSONEncoding
    case URLAndJSONEncoding
    
    public func encode(URLRequest: inout URLRequest,
                       bodyParameters: Parameters?,
                       URLParameters: Parameters?) throws {
        do {
            switch self {
            case .URLEncoding:
                guard let URLParameters = URLParameters else { return }
                try URLParameterEncoder().encode(URLRequest: &URLRequest, with: URLParameters)
                
            case .JSONEncoding:
                guard let bodyParameters = bodyParameters else { return }
                try JSONParameterEncoder().encode(URLRequest: &URLRequest, with: bodyParameters)
                
            case .URLAndJSONEncoding:
                guard let bodyParameters = bodyParameters,
                    let URLParameters = URLParameters else { return }
                try URLParameterEncoder().encode(URLRequest: &URLRequest, with: URLParameters)
                try JSONParameterEncoder().encode(URLRequest: &URLRequest, with: bodyParameters)
                
            }
        }catch {
            throw error
        }
    }
}

public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
