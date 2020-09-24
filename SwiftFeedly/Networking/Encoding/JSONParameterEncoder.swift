//
//  JSONParameterEncoder.swift
//  SwiftFeedly
//
//  Created by Anton Simakov on 4/30/20.
//  Copyright © 2020 Anton Simakov. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    public func encode(URLRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            URLRequest.httpBody = data
            if URLRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                URLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}
