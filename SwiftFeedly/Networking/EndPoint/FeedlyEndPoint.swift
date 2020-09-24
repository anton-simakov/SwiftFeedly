//
//  FeedlyEndPoint.swift
//  SwiftFeedly
//
//  Created by Anton Simakov on 5/4/20.
//  Copyright © 2020 Anton Simakov. All rights reserved.
//

import Foundation

//enum NetworkEnvironment {
//    case production
//    case sandbox
//}

public enum FeedlyAPI {
    case feeds(ID:String)
}

extension FeedlyAPI: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://cloud.feedly.com/v3"
        }
    }
    
    var baseURL: URL {
        guard let URL = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return URL
    }
    
    var path: String {
        switch self {
        case .feeds(let ID):
            return "feeds/\(ID)"
        }
    }
    
    var HTTPMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
