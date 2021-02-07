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

/**
 Making URL with appeded endpoint from Target
 
 - parameter route: Target type select from enums.
 - returns: string URL
 - warning: nil
 
 
 # Notes: #
 1.
 
 # Example #
 ```
 //
 ```
 
 */
public func url(route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
/**
Making URL with escaped character support with &

- parameter string: Use String url to make it supported URL
- returns: string URL
- warning: nil


# Notes: #
1.

# Example #
```
```

*/
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
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

/**
List of services with actual endpoint name
 
- parameter nil
- returns: nil
- warning: nil


# Notes: #
1. endpoint is the name of your API below example is facts is your endpoint

# Example #
```
https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts
```

*/
// MARK: - TargetType
extension Services : TargetType {
    var baseURL: URL {
        let baseUrl = App.String.BaseURL.url
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
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
    var headers: [String : String]? {
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
    var keyPath : String? {
        switch self {
        case .aboutCanada:
            return nil
        }
    }
}
