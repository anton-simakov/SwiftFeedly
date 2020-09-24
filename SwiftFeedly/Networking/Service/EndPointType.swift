//
//  EndPointType.swift
//  SwiftFeedly
//
//  Created by Anton Simakov on 4/30/20.
//  Copyright © 2020 Anton Simakov. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var HTTPMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
