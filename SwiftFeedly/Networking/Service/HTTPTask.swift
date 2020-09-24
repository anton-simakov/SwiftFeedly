//
//  HTTPTask.swift
//  SwiftFeedly
//
//  Created by Anton Simakov on 4/30/20.
//  Copyright © 2020 Anton Simakov. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        URLParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        URLParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
}
