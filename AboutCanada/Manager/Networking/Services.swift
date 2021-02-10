//
//  Services.swift
//  AboutCanada
//
//  Created by Vivek Goswami on 2/7/21.
//  Copyright © 2021 Vivek Goswami. All rights reserved.
//

import UIKit
import Foundation
import Moya

let provider = MoyaProvider<Services>()

/**
List of services
 
- parameter nil
- returns: nil
- warning: nil


# Notes: #
1.

# Example #
```
```

*/
enum Services {
    // About Canada
    case aboutCanada
}

// MARK: - TargetType
extension Services: TargetType {
    var baseURL: URL {
        let baseUrl = App.BaseURL.url
        guard let url = URL(string: baseUrl) else { fatalError(Error.Message.urlError) }
        return url
    }
    var path: String {
        switch self {
        case .aboutCanada:
            return "/s/2iodh4vg0eortkl/facts"
        }
    }
    var method: Moya.Method {
        switch self {
        case .aboutCanada:
            return .get
        }
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        switch self {
        case .aboutCanada:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    var parameters: [String: Any]? {
        switch self {
        default:
            return [:]
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    /**
    Specify reponse object key for used in Common response model
     
    - parameter nil
    - returns: nil
    - warning: nil


    # Notes: #
    1. keypath is a key name for resonse object which you want to map

    # Example #
    ```
    ```
    */
    var keyPath: String? {
        switch self {
        case .aboutCanada:
            return nil
        }
    }
}
